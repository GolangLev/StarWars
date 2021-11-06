package entities

// Game модель таблицы "games"
type Game struct {
	Id          int    `json:"id" db:"id"`
	Title       string `json:"title" db:"title"`
	SubTitle    string `json:"sub_title" db:"subtitle"`
	Description string `json:"description" db:"description"`
}
