import Sizes from "./Utils/Sizes"
import Time from "./Utils/Time"
import * as THREE from 'three'

export default class Experience {
    constructor(canvas){
        //Global access
        window.experience=this
        //Options
        this.canvas=canvas
        //Setup
        this.sizes=new Sizes()
        this.time= new Time()
        this.scene=new THREE.Scene()


        //Resize Event
        this.sizes.on('resize',()=>{
            this.resize()
        })
        // Time tick event
        this.time.on('tick', () =>
            {
                this.update()
            })
        }
        update(){}
        resize(){}
    
    }