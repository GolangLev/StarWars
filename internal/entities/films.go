package entities

// Film модель таблицы "films"
type Film struct {
	Id          int    `json:"id" db:"id"`
	Title       string `json:"title" db:"title"`
	SubTitle    string `json:"sub_title" db:"subtitle"`
	Description string `json:"description" db:"description"`
	Years       string `json:"years" db:"years"`
}
