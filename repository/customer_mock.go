package repository

import "errors"

type customerRepositoryMock struct {
	customers []Customer
}

func NewCustomerRepositoryMock() customerRepositoryMock {
	customers := []Customer{
		{CustomerID: 1, Name: "Test01", DateOfBirth: "SomeBirtDays", City: "City01", ZipeCode: "404", Status: "1"},
		{CustomerID: 2, Name: "Test02", DateOfBirth: "SomeBirtDays", City: "City02", ZipeCode: "404", Status: "1"},
		{CustomerID: 3, Name: "Test03", DateOfBirth: "SomeBirtDays", City: "City03", ZipeCode: "404", Status: "1"},
	}

	return customerRepositoryMock{customers: customers}
}

func (r customerRepositoryMock) GetAll() ([]Customer, error) {
	return r.customers, nil
}

func (r customerRepositoryMock) GetById(id int) (*Customer, error) {
	for _, customer := range r.customers {
		if customer.CustomerID == id {
			return &customer, nil
		}
	}

	return nil, errors.New("Customer not found!!!")
}