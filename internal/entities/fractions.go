package entities

// Fraction модель таблицы "Fractions"
type Fraction struct {
	Id           int    `json:"id" db:"id"`
	NameFraction string `json:"name_fraction" db:"name_fraction"`
}

type UpdateFraction struct {
	NameFraction *string `json:"name_fraction" db:"name_fraction"`
}
