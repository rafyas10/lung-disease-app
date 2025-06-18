package model

type Jawaban struct {
	ID     int  `json:"id"`
	Answer bool `json:"answer"`
}

type DiagnosaInput struct {
	Jawaban []Jawaban `json:"jawaban"`
}
