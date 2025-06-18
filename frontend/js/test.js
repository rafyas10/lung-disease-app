// js/test.js

const gejalaList = [
  "Batuk berkepanjangan",
  "Sesak napas",
  "Demam tinggi",
  "Nyeri dada",
  "Keringat malam",
  "Penurunan berat badan",
  "Batuk berdarah",
  "Lemas",
  "Nafas berbunyi",
  "Pembengkakan kaki",
  "Sakit kepala",
  "Sulit tidur",
  "Tidak nafsu makan"
];

let currentIndex = 0;
const responses = [];

const questionText = document.getElementById("question-text");
const btnYes = document.getElementById("btn-yes");
const btnNo = document.getElementById("btn-no");

function showQuestion(index) {
  if (index >= gejalaList.length) {
    finish();
    return;
  }
  questionText.textContent = `Apakah Anda mengalami: ${gejalaList[index]}?`;
}

btnYes.addEventListener("click", () => {
  responses.push({ id: currentIndex + 1, answer: true });
  currentIndex++;
  showQuestion(currentIndex);
});

btnNo.addEventListener("click", () => {
  responses.push({ id: currentIndex + 1, answer: false });
  currentIndex++;
  showQuestion(currentIndex);
});

function finish() {
  questionText.textContent = "Analisis selesai. Mengirim data...";
  btnYes.disabled = true;
  btnNo.disabled = true;

  fetch("http://localhost:8080/api/diagnosa", { // ← diperbaiki
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ jawaban: responses })
  })
    .then((res) => res.json())
    .then((data) => {
      document.getElementById("result").innerHTML = `
        <h4>Hasil Diagnosa:</h4>
        <p><strong>${data.hasil || "Tidak ada hasil"}</strong></p>
        <p>Skor: ${data.skor?.toFixed(2) || "0"}%</p>
        <p><strong>Deskripsi:</strong> ${data.deskripsi || "-"}</p>
        <p><strong>Solusi:</strong> ${data.solusi || "-"}</p>
      `;
    })
    .catch((err) => {
      document.getElementById("result").innerHTML = `<p class="text-danger">Gagal mengirim data: ${err.message}</p>`;
    });
}

showQuestion(currentIndex);
