package com.spring.FitInZip.view.mypage;


import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FitInZip.back.mypage.MypageService;
import com.spring.FitInZip.back.mypage.vo.UserClsDTO;
import com.spring.FitInZip.back.mypage.vo.UserCountDTO;
import com.spring.FitInZip.back.mypage.vo.UserCouponDTO;
import com.spring.FitInZip.back.mypage.vo.UserProductDTO;
import com.spring.FitInZip.back.mypage.vo.UserWithdrawalDTO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.FitInZip.back.admin.vo.MapVO;
import com.spring.FitInZip.back.calendar.dto.CalendarClassDTO;
import com.spring.FitInZip.back.calendar.service.CalendarService;
import com.spring.FitInZip.back.calendar.vo.CalendarVO;
import com.spring.FitInZip.back.cls.vo.ClsVO;
import com.spring.FitInZip.back.common.service.MemCouponService;
import com.spring.FitInZip.back.common.vo.MemCouponVO;
import com.spring.FitInZip.back.member.vo.MemberVO;

@Controller
public class MypageController {
	
	//??????????????? ?????????
	@Autowired
	private MypageService mypageService;
	
	// ?????????
	@Autowired
	private CalendarService calendarService;
	
	// ?????? ??????
	@Autowired
	private MemCouponService memCouponService;
	
	@RequestMapping(value="calendar")
	public String goCalendar(HttpServletRequest request, Model model, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("member");	
		
		member = mypageService.getMember(member.getId());
		try {
			String profileImgFilePath = member.getMemFileName();
			member.setProfileImgFileName(member.getMemFileName().substring(profileImgFilePath.indexOf("resources")));
		} catch (NullPointerException e) {
			
		}
		//?????? ?????????
		model.addAttribute("member", member);
		
		return "calendar/myCalendar";
	}
	
	@RequestMapping(value = "getAttendance")
	@ResponseBody
	public List<CalendarVO> getAttendance(HttpSession session) {
		String id = ((MemberVO)session.getAttribute("member")).getId();
		List<CalendarVO> list = calendarService.selectAttendList(id);
		
		return list;
	}
	
	
	@RequestMapping(value = "setAttendance")
	@ResponseBody
	public Map<String, String> name(HttpSession session, @RequestParam Map<String, Object>lastday ) {
		String id = ((MemberVO)session.getAttribute("member")).getId();
		
		CalendarVO vo = calendarService.chkAttendance(id);
		Map<String, String> map = new HashMap<String, String>();
		
		System.out.println("????????? ??? : " + lastday.get("lastday"));
		
		if(vo != null) {
			map.put("result", "overlap");
			//map.put("coupon", "issue");
			return map;
		}
		
		int result = calendarService.insertAttendance(id);
		if(result == 1) {
			map.put("result", "chk");
			
			  Calendar cal = java.util.Calendar.getInstance(); SimpleDateFormat format =
			  new SimpleDateFormat("yyyy-MM"); 
			  String from = format.format(cal.getTime()) + "%"; 
			  System.out.println("?????? : " + from);
			  
			  Map<String, String> user = new HashMap<String, String>();
			  user.put("mem_id", id);
			  user.put("attend_date", from);
			  
			  int count = calendarService.countDayOfMonth(user);
			  
			  if(count == Integer.parseInt((String)lastday.get("lastday"))) {
				  map.put("coupon", "issue");
				  
				  from = from.substring(5, 7);
				  
				  System.out.println("from: " + from);
				  
				  int parsedMonth = Integer.parseInt(from);
				  String couponMonth = "";
				  MemCouponVO coupvo = new MemCouponVO();
				  
				  switch (parsedMonth) {
					case 1:
						break;
					case 2:
						couponMonth = "february";
						break;
					case 3:
						couponMonth = "march";
						break;
					case 4:
						couponMonth = "april";
						break;
					case 5:
						break;
					case 6:
						break;
					case 7:
						break;
					case 8:
						break;
					case 9:
						break;
					case 10:
						break;
					case 11:
						break;
					case 12:
						break;
				}
				
				coupvo.setMemId(id);
				coupvo.setCouponCode(couponMonth);
				coupvo.setCouponStatus("CPU01");
				
				System.out.println("coupvo : " + coupvo.toString());
				
				int insertReslt = memCouponService.memCouponInsert(coupvo);
				System.out.println("?????? ?????? ?????? : " + insertReslt);
				
			  }
			  
		}
		return map;
	}
	
	// ????????? ?????? ?????? ??????
	@RequestMapping("/getClsInfo")
	@ResponseBody
	public List<CalendarClassDTO> getClsInfo(HttpSession session) throws ParseException {
		String id = ((MemberVO)session.getAttribute("member")).getId();
		
		// id??? ???????????? cls_code ?????? ??????
		List<String> clsCode = calendarService.getClsCode(id);
		
		System.out.println("clsCode : " + clsCode);
		
		// CalendarClassDTO ????????? List ??????
		List<CalendarClassDTO> clsInfo = new ArrayList<CalendarClassDTO>();
		
		for (String code : clsCode) {
			CalendarClassDTO dto = calendarService.getClsInfo(code);
			
			SimpleDateFormat converter = new SimpleDateFormat("yyyy-mm-dd");
			Date temp = converter.parse(dto.getStartDate());
			Date temp2 = converter.parse(dto.getEndDate());
			dto.setStartDate(converter.format(temp));
			dto.setEndDate(converter.format(temp2));
			
			clsInfo.add(dto);
		}
		
		System.out.println("clsInfo : " + clsInfo);
		
		return clsInfo;
	}
	
	// cls_code ??????
	private List<String> getClsCode(String mem_id){
		
		return null;
	}
	
	// ????????? ???
	
	
	/*??????????????????*/
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model){
		MemberVO member = (MemberVO)session.getAttribute("member");	
		
		if(member == null) {
			return "redirect:/loginMain";
		}
		
		member = mypageService.getMember(member.getId());
		
		try {
			String profileImgFilePath = member.getMemFileName();
			member.setProfileImgFileName(member.getMemFileName().substring(profileImgFilePath.indexOf("resources")));
		} catch (NullPointerException e) {
			
		}
		
		//?????? ?????????
		model.addAttribute("member", member);
		
		return "mypage/mypage";
	}
	
	/*??????????????? ????????? ????????? ????????? ?????????*/
	@RequestMapping("/userExerciseData")
	@ResponseBody
	public List<UserCountDTO> userExerciseData(HttpSession session) throws JsonProcessingException {
		MemberVO member = (MemberVO)session.getAttribute("member");
		String id = member.getId();
		
		return mypageService.getParticipationRate(id);
	}
	
	/*????????? ?????? ????????????*/
	@RequestMapping("/clsHistory")
	public String clsHistory(HttpSession session, Model model) {
		MemberVO member = (MemberVO)session.getAttribute("member");	
		
		member = mypageService.getMember(member.getId());
		
		try {
			String profileImgFilePath = member.getMemFileName();
			member.setProfileImgFileName(member.getMemFileName().substring(profileImgFilePath.indexOf("resources")));
		} catch (NullPointerException e) {
			
		}
		
		//?????? ?????????
		model.addAttribute("member", member);
		
		return "mypage/clsHistory";
	}
	
	/*?????? ????????? history ?????? ajax??? ?????????*/
	@RequestMapping("/clsdata") 
	@ResponseBody
	public List<UserClsDTO> nowClsData(UserClsDTO dto, HttpSession session, HttpServletRequest request) throws JsonProcessingException {
		MemberVO member = (MemberVO)session.getAttribute("member");
		dto.setMemId(member.getId());
		dto.setClsTimeStatus(request.getParameter("clsTimeStatus"));
		
		return mypageService.nowGetUserCls(dto);
		
	}
	
	
	/*????????? ????????? ???????????????*/
	@RequestMapping("/insertCheckIn") 
	@ResponseBody
	public String insertCheckIn(UserClsDTO dto, HttpSession session, HttpServletRequest request) throws JsonProcessingException {
		MemberVO member = (MemberVO)session.getAttribute("member");
		dto.setMemId(member.getId());
		dto.setClsCode(request.getParameter("clsCode"));
		mypageService.insertCheckIn(dto);
		
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.writeValueAsString(null);
		
	}
	
	/*???????????? ????????????*/
	@RequestMapping("/clsHeart")
	public String clsHeart(HttpSession session, Model model) {
		MemberVO member = (MemberVO)session.getAttribute("member");	
		
		member = mypageService.getMember(member.getId());
		
		try {
			String profileImgFilePath = member.getMemFileName();
			member.setProfileImgFileName(member.getMemFileName().substring(profileImgFilePath.indexOf("resources")));
		} catch (NullPointerException e) {
			
		}
		
		//?????? ?????????
		model.addAttribute("member", member);
		
		return "mypage/clsHeart";
	}
	
	/*???????????? ajax??? ?????????*/
	@RequestMapping("/clsHeartData") 
	@ResponseBody
	public List<UserClsDTO> clsHeartData(UserClsDTO dto, HttpSession session) throws JsonProcessingException {
		MemberVO member = (MemberVO)session.getAttribute("member");
		dto.setMemId(member.getId());
		
		return mypageService.getUserWishCls(dto);
		
	}
	
	/*?????? ?????? ?????????*/
	@RequestMapping("/noHeart")
	@ResponseBody
	public String checkMap(UserClsDTO dto, HttpSession session) throws JsonProcessingException {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		dto.setMemId(member.getId());
		mypageService.deleteWishCls(dto);
		
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.writeValueAsString(null);
	}
	
	/*???????????? ????????????*/
	@RequestMapping("/couponHistory")
	public String couponHistory(HttpSession session, Model model) {
		MemberVO member = (MemberVO)session.getAttribute("member");	
		
		member = mypageService.getMember(member.getId());
		
		try {
			String profileImgFilePath = member.getMemFileName();
			member.setProfileImgFileName(member.getMemFileName().substring(profileImgFilePath.indexOf("resources")));
		} catch (NullPointerException e) {
			
		}
		
		//?????? ?????????
		model.addAttribute("member", member);
		
		return "mypage/couponHistory";
	}
	
	/*???????????? ????????? ?????????*/
	@RequestMapping("/couponData")
	@ResponseBody
	public List<UserCouponDTO> getcouponData(UserCouponDTO dto, HttpSession session) throws JsonProcessingException {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		dto.setMemId(member.getId());
		
		return mypageService.getcouponData(dto);
	}
	
	/*???????????? ????????????*/
	@RequestMapping("/productHistory")
	public String productHistory(HttpSession session, Model model) {
		MemberVO member = (MemberVO)session.getAttribute("member");	
		
		member = mypageService.getMember(member.getId());
		
		try {
			String profileImgFilePath = member.getMemFileName();
			member.setProfileImgFileName(member.getMemFileName().substring(profileImgFilePath.indexOf("resources")));
		} catch (NullPointerException e) {
			
		}
		
		//?????? ?????????
		model.addAttribute("member", member);
		
		return "mypage/productHistory";
	}
	
	/*???????????? ?????? ????????? ?????????*/
	@RequestMapping("/productData")
	@ResponseBody
	public List<UserProductDTO> getProductList(UserProductDTO dto, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("member");
		dto.setMemId(member.getId());
		
		System.out.println("?????????::??????????????? :: " + mypageService.getproductList(dto));
		
		return mypageService.getproductList(dto);
	}
	
	/*???????????? ????????????*/
	@RequestMapping("/updateMemberInfo")
	public String getMember(MemberVO vo, HttpSession session, Model model) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");	
		
		member = mypageService.getMember(member.getId());
		
		try {
			String profileImgFilePath = member.getMemFileName();
			member.setProfileImgFileName(member.getMemFileName().substring(profileImgFilePath.indexOf("resources")));
		} catch (NullPointerException e) {
			
		}
		
		System.out.println("member : " + member);
		
		//?????? ?????????
		model.addAttribute("member", member);
		
		return "mypage/updateMemberInfo";
	}
	
	/*???????????? ??????*/
	@RequestMapping("/UpdateMypage") 
	public String updateMember(MemberVO vo, MultipartFile profileImg, HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
		System.out.println("updateMember ??????");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		System.out.println("updateMember id : " + member.getId());
		System.out.println("updateMember pw : " + member.getPassword());
		
		vo.setId(member.getId());
		vo.setPassword(member.getPassword());
		
		String month = request.getParameter("month");
		if(month.length() == 1) {
			month = "0" + month;
		}
		
		String day = request.getParameter("day");
		if(day.length() == 1) {
			day = "0" + day;
		}
		
		String birth = request.getParameter("year") + month + day;
		System.out.println("birth : " + birth);
		vo.setBirth(birth);
		
		MultipartFile classUploadFile = null;
		String filePath = this.getClass().getResource("").getPath(); 
		filePath = filePath.substring(1, filePath.indexOf(".metadata")) +
			    "FitInZip/src/main/webapp/resources/mypage/imgs/";
		
		String filename = "";
		UUID uuid = null;
		
		if(profileImg != null) {
			uuid = UUID.randomUUID();
			filename = profileImg.getOriginalFilename();
			vo.setProfileImgOriginName(filename);
			
			if(filename != null && !filename.equals("")) {
				filename = filePath + "thumbnail/" + uuid + "_" + filename;
				vo.setProfileImgFileName(filename);
				classUploadFile = profileImg;
				classUploadFile.transferTo(new File(filename));
			}
			
		}
		
		mypageService.updateMember(vo);
		
		return "redirect:/mypage";
	}
	
	
	
	/*???????????? ????????????*/
	@RequestMapping("/withdrawal")
	public String withdrawal(HttpSession session, Model model) {
		MemberVO member = (MemberVO)session.getAttribute("member");	
		
		member = mypageService.getMember(member.getId());
		
		try {
			String profileImgFilePath = member.getMemFileName();
			member.setProfileImgFileName(member.getMemFileName().substring(profileImgFilePath.indexOf("resources")));
		} catch (NullPointerException e) {
			
		}
		
		//?????? ?????????
		model.addAttribute("member", member);
		
		return "mypage/withdrawal";
	}
	
	/*???????????? ??????*/
	@RequestMapping("/deleteUser")
	@ResponseBody
	public String deleteUser(HttpSession session, HttpServletRequest request, UserWithdrawalDTO dto) throws JsonProcessingException {
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		dto.setId(member.getId());
		String wantSay = (String) request.getAttribute("wantSay");
		
		if(wantSay == null) {
			System.out.println("wantSay null : " + wantSay);
			mypageService.deleteUserNoReason(dto);
			
		}else {
			System.out.println("wantSay !null : " + wantSay);
			mypageService.deleteUserIsReason(dto);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.writeValueAsString(null);
	}
	
}
