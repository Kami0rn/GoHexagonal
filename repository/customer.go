package repository

type Customer struct {
	CustomerID  int    `db:"customer_id"`
	Name        string `db:"name"`
	DateOfBirth string `db:"date_of_birth"`
	City        string `db:"city"`
	ZipeCode    string `db:"zipcode"`
	Status      string `db:"status"`
}

type CustomerRepository interface {
	GetAll() ([]Customer, error)
	GetById(int) (*Customer, error)
}
