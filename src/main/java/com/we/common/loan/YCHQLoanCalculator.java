package com.we.common.loan;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Created on 2018/1/6 23:52
 *一次还清还款法
 * @author mh
 */
public class YCHQLoanCalculator extends LoanCalculatorAdapter {

    @Override
    public Loan calLoan(BigDecimal totalLoanMoney, int totalMonth, double loanRate, int rateType) {
        Loan loan = new Loan();
        double monthRate = loanRate / totalMonth / 100;
        BigDecimal monthInterest = totalLoanMoney.multiply(new BigDecimal(monthRate)).setScale(2, BigDecimal.ROUND_HALF_UP);;
        BigDecimal totalInterest = monthInterest.multiply(new BigDecimal(totalMonth)).setScale(2, BigDecimal.ROUND_HALF_UP);;
        List<LoanByMonth> allLoans = new ArrayList<>();
        LoanByMonth lastMonth = new LoanByMonth();
        lastMonth.setMonth(totalMonth);
        lastMonth.setInterest(totalInterest);
        lastMonth.setPayPrincipal(totalLoanMoney);
        lastMonth.setRepayment(totalLoanMoney.add(totalInterest));
        allLoans.add(lastMonth);
        loan.setTotalLoanMoney(totalLoanMoney);
        loan.setAllLoans(allLoans);
        loan.setTotalInterest(totalInterest);
        loan.setTotalRepayment(loan.getTotalInterest().add(totalLoanMoney));
        return loan;
    }
}
