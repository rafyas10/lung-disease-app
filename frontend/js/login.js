import { login } from './api.js';

document.getElementById("login-form").addEventListener("submit", async function (e) {
  e.preventDefault();

  const nama = document.getElementById("nama").value;
  const password = document.getElementById("password").value;

  if (!nama || !password) {
    alert("Nama dan password wajib diisi.");
    return;
  }

  try {
    const response = await login(nama, password);
    alert("Login berhasil!");

    if (!response || !response.user) {
    alert("Data pengguna tidak ditemukan.");
    return;
  }

    // Simpan user ke localStorage jika perlu
    localStorage.setItem("user", JSON.stringify(response.user));

    // Redirect berdasarkan role
    const role = response.user.role;
    if (role === 1) {
      window.location.href = "menu.html"; // pasien
    } else if (role === 2) {
      window.location.href = "pakar.html";
    } else if (role === 0) {
      window.location.href = "admin.html";
    } else {
      alert("Peran tidak dikenali.");
    }

  } catch (err) {
    alert("Login gagal: " + err.message);
  }
});
