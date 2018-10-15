package com.spring.boot.rocks.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.boot.rocks.model.AppProgramarea;
import com.spring.boot.rocks.model.AppRole;
import com.spring.boot.rocks.model.AppUser;
import com.spring.boot.rocks.repository.ProgramareaRepository;
import com.spring.boot.rocks.repository.RoleRepository;
import com.spring.boot.rocks.service.AppRoleService;
import com.spring.boot.rocks.service.UserService;
import com.spring.boot.rocks.validator.UserEditValidator;
import com.spring.boot.rocks.validator.UserAddValidator;

@Controller
@RequestMapping("/")
@SessionAttributes({ "roles", "programareas" })
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private AppRoleService roleService;

	@Autowired
	private RoleRepository roleRepo;

	@Autowired
	private ProgramareaRepository programareaRepo;

	@Autowired
	private UserAddValidator useraddValidator;

	@Autowired
	private UserEditValidator usereditValidator;

	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String root(Model model) {
		return "redirect:userlist";
	}

	@RequestMapping(value = { "home" }, method = RequestMethod.GET)
	public String home(Model model) {
		return "home";
	}

	@RequestMapping(value = { "userlist" }, method = RequestMethod.GET)
	public String listUsers(ModelMap model) {
		List<AppUser> users = userService.findAllUsers();
		model.addAttribute("users", users);
		return "userlist";
	}

	@RequestMapping(value = "registration", method = RequestMethod.GET)
	public String registration(Model model) {
		model.addAttribute("userForm", new AppUser());

		return "userregistration";
	}

	@RequestMapping(value = "registration", method = RequestMethod.POST)
	public String registration(@ModelAttribute("userForm") AppUser userForm, BindingResult bindingResult, Model model) {
		useraddValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "userregistration";
		}

		userService.save(userForm);

		model.addAttribute("success", "User " + userForm.getUsername() + " created successfully");
		return "success";

	}

	@RequestMapping(value = { "edit-user-{username}" }, method = RequestMethod.GET)
	public String editUser(@PathVariable String username, Model model) {
		AppUser user = userService.findByUsername(username);
		model.addAttribute("userForm", user);
		model.addAttribute("edit", true);
		return "userregistration";
	}

	@RequestMapping(value = { "edit-user-{username}" }, method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("userForm") @Valid AppUser userForm, BindingResult bindingResult,
			Model model, @PathVariable String username) {
		usereditValidator.validate(userForm, bindingResult);
		if (bindingResult.hasErrors()) {
			return "userregistration";
		}

		userService.updateUser(userForm);

		model.addAttribute("success", "User " + userForm.getUsername() + " updated successfully");
		return "success";
	}

	@RequestMapping(value = { "view-user-{username}" }, method = RequestMethod.GET)
	public String viewUser(@PathVariable String username, Model model) {
		AppUser user = userService.findByUsername(username);
		model.addAttribute("userForm", user);
		return "userview";
	}

	@RequestMapping(value = { "delete-user-{username}" }, method = RequestMethod.GET)
	public String deleteUser(@PathVariable String username) {
		userService.deleteUserByUsername(username);
		return "redirect:userlist";
	}

	@ModelAttribute("roles")
	public List<AppRole> initializeRoles() {
		return (List<AppRole>) roleRepo.findAll();
	}

	@ModelAttribute("programareas")
	public List<AppProgramarea> initializeProgramareas() {
		return (List<AppProgramarea>) programareaRepo.findAll();
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("error", "Your username and password is invalid.");

		if (logout != null)
			model.addAttribute("message", "You have been logged out successfully.");

		return "login";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);

			SecurityContextHolder.getContext().setAuthentication(null);
		}
		return "redirect:login?logout";
	}

	@RequestMapping(value = "Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("loggedinuser", getPrincipal());
		return "useraccessDenied";
	}

	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

	public String getTimeStamp() {
		TimeZone mytimeZone = TimeZone.getTimeZone("EST");
		Calendar calendar = Calendar.getInstance(mytimeZone);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("EE MMM dd HH:mm:ss zzz yyyy", Locale.US);
		simpleDateFormat.setTimeZone(mytimeZone);
		String setTimeStamp = simpleDateFormat.format(calendar.getTime());
		return setTimeStamp;
	}

}
