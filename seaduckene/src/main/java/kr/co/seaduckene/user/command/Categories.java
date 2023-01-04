package kr.co.seaduckene.user.command;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Categories {

	private String categoryMajorTitle;
	private List<String> categoryMinorList;
}
