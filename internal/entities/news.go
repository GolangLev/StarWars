package entities

import "errors"

// News модель таблицы "news"
type News struct {
	Id          int    `json:"id" db:"id"`
	Title       string `json:"title" db:"title"`
	SubTitle    string `json:"sub_title" db:"subtitle"`
	Description string `json:"description" db:"description"`
}

type UpdateNews struct {
	Title       *string `json:"title"`
	SubTitle    *string `json:"sub_title"`
	Description *string `json:"description"`
}

type NewsJoin struct {
	Title       string `json:"title" db:"title"`
	SubTitle    string `json:"sub_title" db:"subtitle"`
	Description string `json:"description" db:"description"`
	Comment     string `json:"comment" db:"comment"`
}

func (n News) Validate() error {
	if n.Title == "" && n.SubTitle == "" && n.Description == "" {
		return errors.New("create structure has no values")
	}

	return nil
}
