// js/main.js

import { login } from './api.js';

document.addEventListener("DOMContentLoaded", function () {
  const loginForm = document.getElementById("login-form");

  if (loginForm) {
    loginForm.addEventListener("submit", async function (e) {
      e.preventDefault();

      const nama = document.getElementById("nama").value;
      const password = document.getElementById("password").value;

      if (!nama || !password) {
        alert("Nama dan password wajib diisi.");
        return;
      }

      try {
        const result = await login(nama, password);
        alert("Login berhasil!");

        // Simpan informasi user ke localStorage kalau dibutuhkan
        localStorage.setItem("user", JSON.stringify(result.user));

        // Redirect ke halaman diagnosa (atau test.html)
        window.location.href = "menu.html";
      } catch (err) {
        alert("Login gagal: " + err.message);
      }
    });
  }
});
