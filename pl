const bannerContainer=document.querySelector('#ad');const controlsContainer=document.createElement('div');controlsContainer.classList.add('controls-container');const playBtn=document.createElement('button');playBtn.classList.add('play-btn');playBtn.innerHTML='Play';const pauseBtn=document.createElement('button');pauseBtn.classList.add('pause-btn');pauseBtn.innerHTML='Pause';const restartBtn=document.createElement('button');restartBtn.classList.add('restart-btn');restartBtn.innerHTML='Restart';const scrubber=document.createElement('input');scrubber.type='range';scrubber.min=0;scrubber.max=1;scrubber.step=0.01;scrubber.value=0;scrubber.classList.add('scrubber');controlsContainer.appendChild(playBtn);controlsContainer.appendChild(pauseBtn);controlsContainer.appendChild(restartBtn);controlsContainer.appendChild(scrubber);bannerContainer.appendChild(controlsContainer);scrubber.addEventListener('input',syncScrubber);playBtn.addEventListener('click',playTimeline);pauseBtn.addEventListener('click',pauseTimeline);restartBtn.addEventListener('click',restartTimeline);const timelineName=mt;function syncScrubber(){timelineName.pause();timelineName.seek(timelineName.duration()*scrubber.value);}
function playTimeline(){timelineName.play();}
function pauseTimeline(){timelineName.pause();}
function restartTimeline(){timelineName.restart();}
gsap.ticker.fps(60);gsap.ticker.add(()=>{scrubber.value=timelineName.progress();currentTime.innerHTML=timelineName.time();});gsap.ticker.add(()=>{globalTotalDuration.innerHTML=gsap.globalTimeline.duration()});const styles=`.controls-container{display:grid;grid-template-columns:repeat(3,auto);grid-template-rows:repeat(2,auto);grid-gap:10px;justify-content:center;align-items:center;position:fixed;bottom:0;left:0;right:0;padding:20px;background-color:rgba(0,0,0,0.5);z-index:999;}.play-btn,.pause-btn,.restart-btn{padding:10px 20px;margin-right:10px;background-color:#007bff;border:none;color:#fff;cursor:pointer;}.play-btn{left:500px}.pause-btn{left:570px;}.restart-btn{left:650px;}.scrubber{width:800px;margin-left:-400px;}.global-total-duration{padding:5px;border:1px solid#007bff;background-color:#007bff;color:#fff;margin-left:20px;}.total-duration{padding:5px;border:1px solid#007bff;background-color:#007bff;color:#fff;margin-left:100px;}.total-duration{padding:5px;border:1px solid#007bff;background-color:#007bff;color:#fff;margin-left:100px;}.current-time{padding:5px;border:1px solid#ccc;border:1px solid#007bff;background-color:#007bff;color:#fff;margin-left:150px;font-size:14px;font-weight:bold;}`;const styleElement=document.createElement('style');styleElement.innerHTML=styles;document.head.appendChild(styleElement);const globalTotalDuration=document.createElement('span');globalTotalDuration.innerHTML=gsap.globalTimeline.duration()
globalTotalDuration.classList.add('global-total-duration');controlsContainer.appendChild(globalTotalDuration);const totalDuration=document.createElement('span');totalDuration.innerHTML=timelineName.duration();totalDuration.classList.add('total-duration');controlsContainer.appendChild(totalDuration);const currentTime=document.createElement('span');currentTime.innerHTML=timelineName.time();currentTime.classList.add('current-time');controlsContainer.appendChild(currentTime);playBtn.style.gridColumn='1 / span 1';pauseBtn.style.gridColumn='2 / span 1';restartBtn.style.gridColumn='3 / span 1';scrubber.style.gridColumn='1 / span 2';scrubber.style.justifySelf='start';
