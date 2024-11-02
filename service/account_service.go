package service

import (
	"GoHexagonal/errs"
	"GoHexagonal/logs"
	"GoHexagonal/repository"
)

type accountService struct {
	accountRepository repository.AccountRepository
}

func NewAccountService (accountRepository repository.AccountRepository) AccountService {
	return accountService{accountRepository : accountRepository}
}

func (s accountService) NewAccount(customerID int, request NewAccountRequest) (*AccountResponse , error) {
	return nil,nil
}

func (s accountService) GetAccounts(customerID int) ([]AccountResponse , error) {
	accounts , err := s.accountRepository.GetAll(customerID)
	if err != nil {
		logs.Error(err)
		return nil , errs.NewUnexspected()
	}

	responses := []AccountResponse{}
	for _, account := range accounts {
		responses = append(responses, AccountResponse{
			AccountID: account.AccountID,
			OpeningDate: account.OpeningDate,
			AccountType: account.AccountType,
			Amount: account.Amount,
			Status: account.Status,
		})
	}
	return responses , nil
}