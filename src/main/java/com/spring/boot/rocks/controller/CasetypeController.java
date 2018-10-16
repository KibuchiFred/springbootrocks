package com.spring.boot.rocks.controller;

import java.util.List;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.boot.rocks.model.AppAgency;
import com.spring.boot.rocks.model.AppCasetype;
import com.spring.boot.rocks.model.AppProgramarea;
import com.spring.boot.rocks.repository.ProgramareaRepository;
import com.spring.boot.rocks.service.CasetypeService;
import com.spring.boot.rocks.validator.CasetypeEditValidator;
import com.spring.boot.rocks.validator.CasetypeAddValidator;

@Controller
@RequestMapping("/")
@SessionAttributes("appProgramarea")
public class CasetypeController {
	@Autowired
	private CasetypeService casetypeService;

	@Autowired
	private CasetypeAddValidator casetypeaddValidator;

	@Autowired
	private CasetypeEditValidator casetypeeditValidator;
	
	@Autowired
	private ProgramareaRepository programareaRepo;
	
	@ModelAttribute("appProgramarea")
	public List<AppProgramarea> initializeAgencies() {
		return (List<AppProgramarea>) programareaRepo.findAll();
	}

	@RequestMapping(value = { "casetypelist" }, method = RequestMethod.GET)
	public String listCasetypes(ModelMap model) {
		List<AppCasetype> casetypes = casetypeService.findAllAgencies();

		model.addAttribute("casetypes", casetypes);

		return "casetypelist";
	}

	@RequestMapping(value = "casetyperegistration", method = RequestMethod.GET)
	public String registration(Model model) {
		model.addAttribute("casetypeForm", new AppCasetype());

		return "casetyperegistration";
	}

	@RequestMapping(value = "casetyperegistration", method = RequestMethod.POST)
	public String registration(@ModelAttribute("casetypeForm") AppCasetype casetypeForm, BindingResult bindingResult,
			Model model) {
		casetypeaddValidator.validate(casetypeForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "casetyperegistration";
		}

		casetypeService.save(casetypeForm);

		model.addAttribute("success", "Casetype " + casetypeForm.getCasetypename() + " created successfully");
		return "success";

	}

	@RequestMapping(value = { "edit-casetype-{casetypename}" }, method = RequestMethod.GET)
	public String editCasetype(@PathVariable String casetypename, Model model) {
		AppCasetype casetype = casetypeService.findByCasetypename(casetypename);
		model.addAttribute("casetypeForm", casetype);
		model.addAttribute("edit", true);
		return "casetyperegistration";
	}

	@RequestMapping(value = { "edit-casetype-{casetypename}" }, method = RequestMethod.POST)
	public String updateCasetype(@ModelAttribute("casetypeForm") @Valid AppCasetype casetypeForm, BindingResult bindingResult,
			Model model, @PathVariable String casetypename) {
		casetypeeditValidator.validate(casetypeForm, bindingResult);
		if (bindingResult.hasErrors()) {
			return "casetyperegistration";
		}

		casetypeService.updateCasetype(casetypeForm);

		model.addAttribute("success", "Casetype " + casetypeForm.getCasetypename() + " updated successfully");
		return "success";
	}

	@RequestMapping(value = { "view-casetype-{casetypename}" }, method = RequestMethod.GET)
	public String viewCasetype(@PathVariable String casetypename, Model model) {
		AppCasetype casetype = casetypeService.findByCasetypename(casetypename);
		model.addAttribute("casetypeForm", casetype);
		return "casetypeview";
	}

	@RequestMapping(value = { "delete-casetype-{casetypename}" }, method = RequestMethod.GET)
	public String deleteCasetype(@PathVariable String casetypename) {
		casetypeService.deleteCasetypeByCasetypename(casetypename);
		return "redirect:casetypelist";
	}

	

}
