const container = document.getElementById('container');
const registerBtn = document.getElementById('register');
const loginBtn = document.getElementById('login');
const billBtn = document.getElementById('bill');

registerBtn.addEventListener('click',()=>{
	container.classList.add("active");
});


loginBtn.addEventListener('click',()=>{
	container.classList.remove("active");
});


billBtn.addEventListener('click',()=>{
	container.classList.add("active");
})