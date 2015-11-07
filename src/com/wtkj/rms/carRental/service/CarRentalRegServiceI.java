package com.wtkj.rms.carRental.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.common.model.User;
import com.wtkj.rms.carRental.model.CarRentalReg;
import com.wtkj.rms.carRental.model.CarRentalRegVo;

public interface CarRentalRegServiceI {
	public List<CarRentalReg> dataGrid(User user,
			CarRentalRegVo paramCarRentalReg, PageFilter paramPageFilter);

	public Long count(User user, CarRentalRegVo vo, PageFilter paramPageFilter);

	public CarRentalReg get(Long id);

	public Long add(CarRentalReg paramCarRentalReg,
			HttpServletRequest paramHttpServletRequest);

	public void edit(CarRentalReg paramCarRentalReg,
			HttpServletRequest paramHttpServletRequest);

	public void delete(String paramString);
}
