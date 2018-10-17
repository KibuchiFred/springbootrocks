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
import com.spring.boot.rocks.model.AppCasestep;
import com.spring.boot.rocks.model.AppCasetype;
import com.spring.boot.rocks.model.AppProgramarea;
import com.spring.boot.rocks.model.AppRole;
import com.spring.boot.rocks.repository.CasetypeRepository;
import com.spring.boot.rocks.repository.ProgramareaRepository;
import com.spring.boot.rocks.repository.RoleRepository;
import com.spring.boot.rocks.service.CasestepService;
import com.spring.boot.rocks.validator.CasestepEditValidator;
import com.spring.boot.rocks.validator.CasestepAddValidator;

@Controller
@RequestMapping("/")
@SessionAttributes({"appCasetype"})
public class CasestepController {
	@Autowired
	private CasestepService casestepService;

	@Autowired
	private CasestepAddValidator casestepaddValidator;

	@Autowired
	private CasestepEditValidator casestepeditValidator;
	
	@Autowired
	private CasetypeRepository casetypeRepo;
	
	
	@Autowired
	private RoleRepository roleRepo;
	
	@ModelAttribute("appCasetype")
	public List<AppCasetype> initializeCaseTypes() {
		return (List<AppCasetype>) casetypeRepo.findAll();
	}

	@ModelAttribute("appRole")
	public List<AppRole> initializeRoles() {
		return (List<AppRole>) roleRepo.findAll();
	}
	
	
	@RequestMapping(value = { "casesteplist" }, method = RequestMethod.GET)
	public String listCasesteps(ModelMap model) {
		List<AppCasestep> casesteps = casestepService.findAllAgencies();

		model.addAttribute("casesteps", casesteps);

		return "casesteplist";
	}

	@RequestMapping(value = "casestepregistration", method = RequestMethod.GET)
	public String registration(Model model) {
		model.addAttribute("casestepForm", new AppCasestep());

		return "casestepregistration";
	}

	@RequestMapping(value = "casestepregistration", method = RequestMethod.POST)
	public String registration(@ModelAttribute("casestepForm") AppCasestep casestepForm, BindingResult bindingResult,
			Model model) {
		casestepaddValidator.validate(casestepForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "casestepregistration";
		}

		casestepService.save(casestepForm);

		model.addAttribute("success", "Casestep " + casestepForm.getCasestepname() + " created successfully");
		return "success";

	}

	@RequestMapping(value = { "edit-casestep-{casestepname}" }, method = RequestMethod.GET)
	public String editCasestep(@PathVariable String casestepname, Model model) {
		AppCasestep casestep = casestepService.findByCasestepname(casestepname);
		model.addAttribute("casestepForm", casestep);
		model.addAttribute("edit", true);
		return "casestepregistration";
	}

	@RequestMapping(value = { "edit-casestep-{casestepname}" }, method = RequestMethod.POST)
	public String updateCasestep(@ModelAttribute("casestepForm") @Valid AppCasestep casestepForm, BindingResult bindingResult,
			Model model, @PathVariable String casestepname) {
		casestepeditValidator.validate(casestepForm, bindingResult);
		if (bindingResult.hasErrors()) {
			return "casestepregistration";
		}

		casestepService.updateCasestep(casestepForm);

		model.addAttribute("success", "Casestep " + casestepForm.getCasestepname() + " updated successfully");
		return "success";
	}

	@RequestMapping(value = { "view-casestep-{casestepname}" }, method = RequestMethod.GET)
	public String viewCasestep(@PathVariable String casestepname, Model model) {
		AppCasestep casestep = casestepService.findByCasestepname(casestepname);
		model.addAttribute("casestepForm", casestep);
		return "casestepview";
	}

	@RequestMapping(value = { "delete-casestep-{casestepname}" }, method = RequestMethod.GET)
	public String deleteCasestep(@PathVariable String casestepname) {
		casestepService.deleteCasestepByCasestepname(casestepname);
		return "redirect:casesteplist";
	}

	

}
