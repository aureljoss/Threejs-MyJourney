import GUI from 'lil-gui'
import * as THREE from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js'
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader.js'
import { DRACOLoader } from 'three/examples/jsm/loaders/DRACOLoader.js'
import firefliesVertexShader from './Shaders/fireflies/vertex.glsl'
import firefliesFragmentShader from './Shaders/fireflies/fragment.glsl'
import portalVertexShader from './shaders/portal/vertex.glsl'
import portalFragmentShader from './shaders/portal/fragment.glsl'


/**
 * Base
 */
// Debug
const debugObject={}
const gui = new GUI({
    width: 400
})

// Canvas
const canvas = document.querySelector('canvas.webgl')

// Scene
const scene = new THREE.Scene()

/**
 * Loaders
 */
// Texture loader
const textureLoader = new THREE.TextureLoader()

// Draco loader
const dracoLoader = new DRACOLoader()
dracoLoader.setDecoderPath('draco/')

// GLTF loader
const gltfLoader = new GLTFLoader()
gltfLoader.setDRACOLoader(dracoLoader)
/**
 * Textures
 */
const bakedTexture= textureLoader.load('Baked.jpg')
bakedTexture.flipY=false
bakedTexture.colorSpace = THREE.SRGBColorSpace

/**
 * Material
 */
// Baked Material
const bakedMaterial=new THREE.MeshBasicMaterial({map: bakedTexture,side:THREE.DoubleSide})

//Pole Light material
const poleLightMaterial= new THREE.MeshBasicMaterial({color:0xffffe5})

//Portal Light Material
debugObject.portalColorStart='#000000'
debugObject.portalColorEnd='#ffffff'

gui.addColor(debugObject, 'portalColorStart').onChange(()=>{
    portalLightMaterial.uniforms.uColorStart.value.set(debugObject.portalColorStart)
})

gui.addColor(debugObject, 'portalColorEnd').onChange(()=>{
    portalLightMaterial.uniforms.uColorEnd.value.set(debugObject.portalColorEnd)
})

const portalLightMaterial = new THREE.ShaderMaterial({
    uniforms:
    {
        uTime: {value:0}, 
        uColorStart:{value: new THREE.Color(debugObject.portalColorStart)},
        uColorEnd:{value: new THREE.Color(debugObject.portalColorEnd)}
    },
    vertexShader: portalVertexShader,
    fragmentShader: portalFragmentShader
})

/**
 * Model
 */

gltfLoader.load('portal.glb',
    (gltf)=>{
        const bakedMesh= gltf.scene.children.find(child => child.name === 'baked')
        const poleLightAMesh= gltf.scene.children.find((child)=>{
            return child.name === 'poleLightA'
        })
        const poleLightBMesh= gltf.scene.children.find((child)=>{
            return child.name === 'poleLightB'
        })
        const portalLightMesh= gltf.scene.children.find((child)=>{
            return child.name === 'portalLight'
        })

        bakedMesh.material=bakedMaterial
        poleLightAMesh.material=poleLightMaterial
        poleLightBMesh.material=poleLightMaterial
        portalLightMesh.material=portalLightMaterial
        scene.add(gltf.scene)
    }
)

/**
 * Fireflies
 */
// Geometry
const firefliesGeometry= new THREE.BufferGeometry()
const firefliesCount=50
const positionArray= new Float32Array(firefliesCount*3)
const scaleArray = new Float32Array(firefliesCount)

for (let i=0; i<firefliesCount; i++){
    positionArray[i * 3 + 0] = (Math.random() - 0.5) * 4
    positionArray[i * 3 + 1] = Math.random() * 1.5
    positionArray[i * 3 + 2] = (Math.random() - 0.5) * 4

    scaleArray[i]=Math.random()

}

firefliesGeometry.setAttribute('position', new THREE.BufferAttribute(positionArray, 3))
firefliesGeometry.setAttribute('aScale', new THREE.BufferAttribute(scaleArray, 1))


//Material
const firefliesMaterial = new THREE.ShaderMaterial({
    uniforms:{
        uTime: {value: 0},
        uPixelRatio:{ value: Math.min(window.devicePixelRatio, 2)}, 
        uSize: {value:200}
    },
    vertexShader: firefliesVertexShader, 
    fragmentShader: firefliesFragmentShader,
    transparent:true, 
    blending: THREE.AdditiveBlending,
    depthWrite:false
})

gui.add(firefliesMaterial.uniforms.uSize, 'value').min(0).max(500).step(1).name('firefliesSize')

//Points
const fireflies= new THREE.Points(firefliesGeometry, firefliesMaterial)
scene.add(fireflies)


/**
 * Sizes
 */
const sizes = {
    width: window.innerWidth,
    height: window.innerHeight
}

window.addEventListener('resize', () =>
{
    // Update sizes
    sizes.width = window.innerWidth
    sizes.height = window.innerHeight

    // Update camera
    camera.aspect = sizes.width / sizes.height
    camera.updateProjectionMatrix()

    // Update renderer
    renderer.setSize(sizes.width, sizes.height)
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))

    //Update fireflies
    firefliesMaterial.uniforms.uPixelRatio.value= Math.min(window.devicePixelRatio, 2)
})

/**
 * Camera
 */
// Base camera
const camera = new THREE.PerspectiveCamera(45, sizes.width / sizes.height, 0.1, 100)
camera.position.x = 4
camera.position.y = 2
camera.position.z = 4
scene.add(camera)

// Controls
const controls = new OrbitControls(camera, canvas)
controls.enableDamping = true

/**
 * Renderer
 */
const renderer = new THREE.WebGLRenderer({
    canvas: canvas,
    antialias: true
})
renderer.setSize(sizes.width, sizes.height)
renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))

debugObject.clearColor='#110e0e'
renderer.setClearColor(debugObject.clearColor)
gui.addColor(debugObject, 'clearColor').onChange(()=>{
    renderer.setClearColor(debugObject.clearColor)
})

/**
 * Animate
 */
const clock = new THREE.Clock()

const tick = () =>
{
    const elapsedTime = clock.getElapsedTime()

    //Update Materials
    portalLightMaterial.uniforms.uTime.value = elapsedTime
    firefliesMaterial.uniforms.uTime.value = elapsedTime

    // Update controls
    controls.update()

    // Render
    renderer.render(scene, camera)

    // Call tick again on the next frame
    window.requestAnimationFrame(tick)
}

tick()