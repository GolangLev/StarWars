package entities

import "errors"

// Film модель таблицы "films"
type Film struct {
	Id          int    `json:"id" db:"id"`
	Title       string `json:"title" db:"title"`
	SubTitle    string `json:"sub_title" db:"subtitle"`
	Description string `json:"description" db:"description"`
	Years       string `json:"years" db:"years"`
}

type UpdateFilm struct {
	Title       *string `json:"title" db:"title"`
	SubTitle    *string `json:"sub_title" db:"subtitle"`
	Description *string `json:"description" db:"description"`
	Years       *string `json:"years" db:"years"`
}

type FilmJoin struct {
	Title       string `json:"title" db:"title"`
	SubTitle    string `json:"sub_title" db:"subtitle"`
	Description string `json:"description" db:"description"`
	Years       string `json:"years" db:"years"`
	Comment     string `json:"comment" db:"comment"`
}

func (f Film) Validate() error {
	if f.Title == "" && f.SubTitle == "" && f.Description == "" && f.Years == "" {
		return errors.New("create structure has no values")
	}
	return nil
}
