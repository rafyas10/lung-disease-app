package model

type User struct {
	IDUser   uint   `gorm:"column:id_user;primaryKey" json:"id_user"`
	Role     int    `json:"role"`
	Nama     string `json:"nama"`
	Email    string `json:"email" gorm:"unique"`
	Password string `json:"password"`
	Alamat   string `json:"alamat"`
	TglLahir string `gorm:"column:tgl_lahir" json:"tgl_lahir"`
}

// Gunakan nama tabel sesuai tabel yang sudah ada di MySQL
func (User) TableName() string {
	return "user"
}
// LoginInput hanya untuk input saat login (tanpa email, hanya nama dan password)
type LoginInput struct {
	Nama     string `json:"nama" binding:"required"`
	Password string `json:"password" binding:"required"`
}
