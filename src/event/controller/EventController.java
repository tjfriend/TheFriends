package event.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller()
@RequestMapping("/event")
public class EventController {

	@RequestMapping("/list")
	public String eventList(){
		return "t:event/event";
	}
	
	@RequestMapping("/write")
	public String eventWrite(){
		return "t:event/write";
	}
}
