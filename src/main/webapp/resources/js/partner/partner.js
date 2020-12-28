const posi = document.querySelector('.userPosi');
console.log(posi);
console.log(posi.querySelectorAll('option')[1]);


const i = posi.options[document.querySelector('.userPosi').selectedIndex].innerText;
console.log(i);
/*
posi.querySelectorAll('option').forEach((v,i)=()=>{
 v.addEventListener('selected',()=>{
 console.log(v.value);
});
)

};
*/