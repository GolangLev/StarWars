package entities

// News модель таблицы "news"
type News struct {
	Id          int    `json:"id" db:"id"`
	Title       string `json:"title" db:"title"`
	SubTitle    string `json:"sub_title" db:"subtitle"`
	Description string `json:"description" db:"description"`
}
