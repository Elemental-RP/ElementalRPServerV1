document.getElementsByTagName("body")[0].addEventListener("mousemove", function (n) {
    t.style.left = n.clientX + "px", t.style.top = n.clientY + "px", e.style.left = n.clientX + "px", e.style.top = n.clientY + "px", i.style.left = n.clientX + "px", i.style.top = n.clientY + "px"
});
var t = document.getElementById("cursor"),
    e = document.getElementById("cursor2"),
    i = document.getElementById("cursor3");

function n(t) {
    e.classList.add("hover"), i.classList.add("hover")
}

function s(t) {
    e.classList.remove("hover"), i.classList.remove("hover")
}
s();
for (var r = document.querySelectorAll(".hover-target"), a = r.length - 1; a >= 0; a--) {
    o(r[a])
}

function o(t) {
    t.addEventListener("mouseover", n), t.addEventListener("mouseout", s)
}
var span = document.querySelector("span");
span.addEventListener("input", function () {
    var text = this.innerText;
    this.setAttribute("data-heading", text);
    this.parentElement.setAttribute("data-heading", text)
})

$(function(){"use strict";var t=document.getElementById("wave"),i=t.getContext("2d"),n=t.width=window.innerWidth,e=t.height=window.innerHeight,r=[],a=0,o={count:15,range:{x:20,y:80},duration:{min:20,max:40},thickness:10,strokeColor:"#fff",level:.15,curved:!0},s=function(t,i){return Math.floor(Math.random()*(i-t+1)+t)},h=function(t,i,n,e){return(t/=e/2)<1?n/2*t*t+i:-n/2*(--t*(t-2)-1)+i};i.lineJoin="round",i.lineWidth=o.thickness,i.strokeStyle=o.strokeColor;var u=function(t){this.anchorX=t.x,this.anchorY=t.y,this.x=t.x,this.y=t.y,this.setTarget()};u.prototype.setTarget=function(){this.initialX=this.x,this.initialY=this.y,this.targetX=this.anchorX+s(0,2*o.range.x)-o.range.x,this.targetY=this.anchorY+s(0,2*o.range.y)-o.range.y,this.tick=0,this.duration=s(o.duration.min,o.duration.max)},u.prototype.update=function(){var t=this.targetX-this.x,i=this.targetY-this.y,n=Math.sqrt(t*t+i*i);if(Math.abs(n)<=0)this.setTarget();else{var e=this.tick,r=this.initialY,a=this.targetY-this.initialY,o=this.duration;this.y=h(e,r,a,o),r=this.initialX,a=this.targetX-this.initialX,o=this.duration,this.x=h(e,r,a,o),this.tick++}},u.prototype.render=function(){i.beginPath(),i.arc(this.x,this.y,3,0,2*Math.PI,!1),i.fillStyle="#000",i.fill()};for(var c=function(){for(var t=r.length;t--;)r[t].update()},l=function(){i.beginPath();var t=r.length;i.moveTo(r[0].x,r[0].y);var a;for(a=0;a<t-1;a++){var s=(r[a].x+r[a+1].x)/2,h=(r[a].y+r[a+1].y)/2;i.quadraticCurveTo(r[a].x,r[a].y,s,h)}i.lineTo(-o.range.x-o.thickness,e+o.thickness),i.lineTo(n+o.range.x+o.thickness,e+o.thickness),i.closePath(),i.fillStyle="#fff",i.fill(),i.stroke()},d=function(){i.clearRect(0,0,n,e)},f=function(){window.requestAnimFrame(f,t),a++,d(),c(),l()},g=o.count+2,m=(n+2*o.range.x)/(o.count-1);g--;)r.push(new u({x:m*(g-1)-o.range.x,y:e-e*o.level}));window.requestAnimFrame=window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||window.oRequestAnimationFrame||window.msRequestAnimationFrame||function(t){window.setTimeout(t,1e3/60)},f()});