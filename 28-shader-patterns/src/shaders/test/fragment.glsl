varying vec2 vUv;

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
    //23
    float strength= floor(vUv.x*10.0)/10.0;
    strength*= floor(vUv.y*10.0)/10.0;
    gl_FragColor = vec4(strength, strength, strength, 1.0);
}