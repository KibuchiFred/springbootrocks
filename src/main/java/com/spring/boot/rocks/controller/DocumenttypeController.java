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

import com.spring.boot.rocks.model.AppCasetype;
import com.spring.boot.rocks.model.AppDocumenttype;
import com.spring.boot.rocks.repository.CasetypeRepository;
import com.spring.boot.rocks.service.DocumenttypeService;
import com.spring.boot.rocks.validator.DocumenttypeEditValidator;
import com.spring.boot.rocks.validator.DocumenttypeAddValidator;

@Controller
@RequestMapping("/")
@SessionAttributes("appProgramarea")
public class DocumenttypeController {
	@Autowired
	private DocumenttypeService documenttypeService;

	@Autowired
	private DocumenttypeAddValidator documenttypeaddValidator;

	@Autowired
	private DocumenttypeEditValidator documenttypeeditValidator;
	
	@Autowired
	private CasetypeRepository casetypeRepo;
	
	@ModelAttribute("appCasetype")
	public List<AppCasetype> initializeCaseTypes() {
		return (List<AppCasetype>) casetypeRepo.findAll();
	}

	
	@RequestMapping(value = { "documenttypelist" }, method = RequestMethod.GET)
	public String listCasetypes(ModelMap model) {
		List<AppDocumenttype> casetypes = documenttypeService.findAllDoctypes();

		model.addAttribute("documenttypes", casetypes);

		return "documenttypelist";
	}

	@RequestMapping(value = "documenttyperegistration", method = RequestMethod.GET)
	public String registration(Model model) {
		model.addAttribute("documenttypeForm", new AppDocumenttype());

		return "documenttyperegistration";
	}

	@RequestMapping(value = "documenttyperegistration", method = RequestMethod.POST)
	public String registration(@ModelAttribute("documenttypeForm") AppDocumenttype documenttypeForm, BindingResult bindingResult,
			Model model) {
		documenttypeaddValidator.validate(documenttypeForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "documenttyperegistration";
		}

		documenttypeService.save(documenttypeForm);

		model.addAttribute("success", "Documenttype " + documenttypeForm.getDocumenttypename() + " created successfully");
		return "success";

	}

	@RequestMapping(value = { "edit-documenttype-{documenttypename}" }, method = RequestMethod.GET)
	public String editDocumenttype(@PathVariable String documenttypename, Model model) {
		AppDocumenttype documenttype = documenttypeService.findByDocumenttypename(documenttypename);
		model.addAttribute("documenttypeForm", documenttype);
		model.addAttribute("edit", true);
		return "documenttyperegistration";
	}

	@RequestMapping(value = { "edit-documenttype-{documenttypename}" }, method = RequestMethod.POST)
	public String updateDocumenttype(@ModelAttribute("documenttypeForm") @Valid AppDocumenttype documenttypeForm, BindingResult bindingResult,
			Model model, @PathVariable String documenttypename) {
		documenttypeeditValidator.validate(documenttypeForm, bindingResult);
		if (bindingResult.hasErrors()) {
			return "documenttyperegistration";
		}

		documenttypeService.updateDocumenttype(documenttypeForm);

		model.addAttribute("success", "Documenttype " + documenttypeForm.getDocumenttypename() + " updated successfully");
		return "success";
	}

	@RequestMapping(value = { "view-documenttype-{documenttypename}" }, method = RequestMethod.GET)
	public String viewDocumenttype(@PathVariable String documenttypename, Model model) {
		AppDocumenttype documenttype = documenttypeService.findByDocumenttypename(documenttypename);
		model.addAttribute("documenttypeForm", documenttype);
		return "documenttypeview";
	}

	@RequestMapping(value = { "delete-documenttype-{documenttypename}" }, method = RequestMethod.GET)
	public String deleteDocumenttype(@PathVariable String documenttypename) {
		documenttypeService.deleteDocumenttypeByDocumenttypename(documenttypename);
		return "redirect:documenttypelist";
	}

	

}
