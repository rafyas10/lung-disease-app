import { register } from './api.js';

document.getElementById("register-form").addEventListener("submit", async function (e) {
  e.preventDefault();

  const data = {
    nama: document.getElementById("nama").value,
    email: document.getElementById("email").value,
    password: document.getElementById("password").value,
    alamat: document.getElementById("alamat").value,
    tgl_lahir: document.getElementById("tgl_lahir").value,
  };

  if (!data.nama || !data.email || !data.password || !data.alamat || !data.tgl_lahir) {
  alert("Semua field wajib diisi.");
  return;
  }
  
  try {
    await register(data);
    alert("Registrasi berhasil!");
    window.location.href = "index.html";
  } catch (err) {
    alert("Registrasi gagal: " + err.message);
  }
});
