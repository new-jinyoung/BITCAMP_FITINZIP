package com.spring.FitInZip.back.payment.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class PaymentVO {

	private Integer payIndex;
	private String  clsCode;
	private String orderNum;
	private String memId;
	private Integer originPrice;
	private Integer paidPrice;
	private Integer commission;
	private Integer netPrice;
	private String payMethod;
	private Date payDate;
}
