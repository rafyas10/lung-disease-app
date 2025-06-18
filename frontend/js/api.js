// js/api.js

const API_BASE = "http://localhost:8081/api"; // Ganti dengan URL Cloud Run nanti

// 🔐 LOGIN
export async function login(nama, password) {
  const res = await fetch(`${API_BASE}/login`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ nama, password }),
  });

  if (!res.ok) {
    const err = await res.json();
    throw new Error(err.message || "Login gagal");
  }

  return res.json();
}

// 📝 REGISTER
export async function register(data) {
  const res = await fetch(`${API_BASE}/register`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data),
  });

  if (!res.ok) {
    const err = await res.json();
    throw new Error(err.message || "Registrasi gagal");
  }

  return res.json();
}
