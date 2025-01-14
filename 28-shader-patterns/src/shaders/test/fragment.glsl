#define PI 3.1415926535897932384626433832795;

varying vec2 vUv;

float random(vec2 st)
{
    return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

vec2 rotate(vec2 uv, float rotation, vec2 mid)
{
    return vec2(
      cos(rotation) * (uv.x - mid.x) + sin(rotation) * (uv.y - mid.y) + mid.x,
      cos(rotation) * (uv.y - mid.y) - sin(rotation) * (uv.x - mid.x) + mid.y
    );
}

void main()
{
    //01
    // gl_FragColor = vec4(vUv.x, vUv.y 1.0, 1.0);
    //02
    // gl_FragColor = vec4(vUv.x, vUv.y, 0.0, 1.0);
    //03
    // float strength= vUv.x;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    //04
    // float strength= vUv.y;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    //05
    // float strength= 1.0-vUv.y;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //06
    // float strength= vUv.y*10.0;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    //07
    // float strength= mod(vUv.y*10.0, 1.0);
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //08
    // float strength= mod(vUv.y*10.0, 1.0);
    // strength= step(0.5,strength);
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    //09
    // float strength= mod(vUv.y*10.0, 1.0)-0.3;
    // strength= step(0.5,strength);
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    //10
    // float strength= mod(vUv.x*10.0, 1.0)-0.3;
    // strength= step(0.5,strength);
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    //11
    // float strengthA= mod(vUv.y*10.0, 1.0)-0.3;
    // strengthA= step(0.5,strengthA);
    // float strengthB= mod(vUv.x*10.0, 1.0)-0.3;
    // strengthB= step(0.5,strengthB);
    // float strength=strengthA+strengthB;
    // gl_FragColor = vec4(strength, strength, strength, 1.0); 
    //12
    // float strengthA= mod(vUv.y*10.0, 1.0)-0.3;
    // strengthA= step(0.5,strengthA);
    // float strengthB= mod(vUv.x*10.0, 1.0)-0.3;
    // strengthB= step(0.5,strengthB);
    // float strength=strengthA*strengthB;
    // gl_FragColor = vec4(strength, strength, strength, 1.0); 
    //13
    // float strengthA= mod(vUv.y*10.0, 1.0)-0.3;
    // strengthA= step(0.5,strengthA);
    // float strengthB= mod(vUv.x*10.0, 1.0)-0.3;
    // strengthB= step(0.5,strengthB);
    // float strength=strengthA-strengthB;
    // gl_FragColor = vec4(strength, strength, strength, 1.0); 
    // //14
    // float strengthA= step(0.4,mod(vUv.x*10.0, 1.0));
    // strengthA *= step(0.8,mod(vUv.y*10.0, 1.0));
    // float strengthB= step(0.4,mod(vUv.y*10.0, 1.0));
    // strengthB *= step(0.8,mod(vUv.x*10.0, 1.0));
    //15
    // float strengthA= step(0.4,mod(vUv.x*10.0-0.2, 1.0));
    // strengthA *= step(0.8,mod(vUv.y*10.0, 1.0));
    // float strengthB= step(0.4,mod(vUv.y*10.0-0.2, 1.0));
    // strengthB *= step(0.8,mod(vUv.x*10.0, 1.0));
    // //16
    // float strength= abs(vUv.x-0.5);
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //17
    // float strength=min(abs(vUv.x-0.5),abs(vUv.y-0.5));
    //18
    // float strength=max(abs(vUv.x-0.5),abs(vUv.y-0.5));
    // //19
    // float strength=step(0.2,(max(abs(vUv.x-0.5),abs(vUv.y-0.5))));
    // //20
    // float strengthA=1.0-step(0.25,(max(abs(vUv.x-0.5),abs(vUv.y-0.5))));
    // float strengthB=step(0.20,(max(abs(vUv.x-0.5),abs(vUv.y-0.5))));
    // float strength=strengthA*strengthB;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //21
    // float strength= floor(vUv.x*10.0)/10.0;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //22
    // float strength= floor(vUv.x*10.0)/10.0;
    // strength*= floor(vUv.y*10.0)/10.0;
    // //23
    // float strength= random(vUv);
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    //24
    // vec2 gridUv=vec2(floor(vUv.x*10.0)/10.0,
    //                 floor(vUv.y*10.0)/10.0
    // );
    // float strength= random(gridUv);
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //25
    // vec2 gridUv=vec2(floor(vUv.x*10.0)/10.0,
    //                 floor(vUv.y*10.0+vUv.x*5.0)/10.0
    // );
    // float strength= random(gridUv);
    // //26
    // float strength= length(vUv);
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //27
    // float strength= distance(vUv, vec2(0.5));
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //28 
    // float strength= 1.0-distance(vUv, vec2(0.5));
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //29
    // float strength= 0.015/distance(vUv, vec2(0.5));
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //30
    // vec2 lightUv=vec2(vUv.x*0.2+0.4,vUv.y);
    // float strength= 0.015/distance(lightUv, vec2(0.5));
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //31
    // vec2 lightUvX=vec2(vUv.x*0.1+0.45,vUv.y*0.5+0.25);
    // float strengthA= 0.015/distance(lightUvX, vec2(0.5));
    // vec2 lightUvY=vec2(vUv.y*0.1+0.45,vUv.x*0.5+0.25);
    // float strengthB= 0.015/distance(lightUvY, vec2(0.5));
    // float strength=strengthA*strengthB;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //32
    // vec2 rotatedUv= rotate(vUv, 1.0, vec2(0.5));
    // vec2 lightUvX=vec2(rotatedUv.x*0.1+0.45,rotatedUv.y*0.5+0.25);
    // float strengthA= 0.015/distance(lightUvX, vec2(0.5));
    // vec2 lightUvY=vec2(rotatedUv.y*0.1+0.45,rotatedUv.x*0.5+0.25);
    // float strengthB= 0.015/distance(lightUvY, vec2(0.5));
    // float strength=strengthA*strengthB;
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    // //33
    // float strength= step(0.25,distance(vUv, vec2(0.5)));
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    //34
    float strength= step(0.25,distance(vUv, vec2(0.5)));
    gl_FragColor = vec4(strength, strength, strength, 1.0);
}