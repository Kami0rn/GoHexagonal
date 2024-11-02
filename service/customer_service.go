package service

import (
	"GoHexagonal/errs"
	"GoHexagonal/logs"
	"GoHexagonal/repository"
	"database/sql"
	// "errors"
	// "net/http"
	// "log"
)

type customerService struct {
	customerRepository repository.CustomerRepository
}

func NewCustomerService(customerRepository repository.CustomerRepository) customerService {
	return customerService{customerRepository: customerRepository}
}

func (s customerService) GetCustomers() ([]CustomerResponse, error) {
	customers , err := s.customerRepository.GetAll()
	if err != nil {
		logs.Error(err)
		return nil,errs.NewUnexspected()
	}

	customerResponses := []CustomerResponse{}
	for _, customer := range customers {
		customerResponse := CustomerResponse{
			CustomerID: customer.CustomerID,
			Name: customer.Name,
			Status: customer.Status,
		}
		customerResponses = append(customerResponses, customerResponse)
	}

	return customerResponses,nil


}

func (s customerService) GetCustomer(id int) (*CustomerResponse, error){
	customer ,err := s.customerRepository.GetById(id)
	if err != nil {

		if err == sql.ErrNoRows {
			return nil , errs.NewNotFoundError("customer not found")
		}

		logs.Error(err)
		return nil ,errs.NewUnexspected()
	}

	customerResponse := CustomerResponse{
		CustomerID: customer.CustomerID,
		Name: customer.Name,
		Status: customer.Status,
	}

	return &customerResponse , nil
}