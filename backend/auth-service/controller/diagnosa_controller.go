// controller/diagnosa_controller.go
package controller

import (
	"auth-service/database"
	"auth-service/model"
	"net/http"

	"github.com/gin-gonic/gin"
)

func Diagnosa(c *gin.Context) {
	var input model.DiagnosaInput
	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Format data tidak valid"})
		return
	}

	var hasil []int
	for _, j := range input.Jawaban {
		if j.Answer {
			hasil = append(hasil, j.ID)
		}
	}

	// Peta ID gejala untuk masing-masing penyakit (disamakan dengan struktur tabel penyakit)
	peta := map[string][]int{
		"Pneumonia":      {1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13},
		"Tuberkulosis":   {1, 2, 4, 5, 6, 7, 8, 11, 12, 13},
		"Asma":           {1, 2, 3, 9, 11, 12},
		"Kanker Paru":    {1, 2, 3, 6, 7, 8, 12, 13},
		"Bronkitis":      {1, 2, 3, 4, 5, 7, 8, 9, 11, 12, 13},
		"PPOK":           {1, 2, 3, 7, 8, 9, 10, 11, 12, 13},
		"Emboli Paru":    {1, 2, 3, 4},
		"TB Ekstra Paru": {1, 2, 3, 4, 5, 6, 7, 8, 11, 12, 13},
		"Asbestosis":     {1, 2, 3},
	}

	skor := make(map[string]float64)
	for penyakit, ids := range peta {
		match := 0
		for _, id := range hasil {
			for _, target := range ids {
				if id == target {
					match++
					break
				}
			}
		}
		skor[penyakit] = float64(match) / float64(len(ids)) * 100
	}

	// Cari penyakit dengan skor tertinggi
	var penyakitTertinggi string
	var skorTertinggi float64
	for nama, val := range skor {
		if val > skorTertinggi {
			skorTertinggi = val
			penyakitTertinggi = nama
		}
	}

	type Solusi struct {
		Deskripsi string `json:"deskripsi"`
		Solusi    string `json:"solusi"`
	}

	var solusi Solusi
	err := database.DB.Raw(`
		SELECT s.deskripsi, s.solusi
		FROM solusi s
		JOIN penyakit p ON s.id_penyakit = p.id_penyakit
		WHERE p.penyakit = ?
	`, penyakitTertinggi).Scan(&solusi).Error
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Gagal mengambil solusi"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"hasil":     penyakitTertinggi,
		"skor":      skorTertinggi,
		"deskripsi": solusi.Deskripsi,
		"solusi":    solusi.Solusi,
	})
}
