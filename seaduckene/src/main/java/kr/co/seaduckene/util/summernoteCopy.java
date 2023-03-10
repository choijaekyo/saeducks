package kr.co.seaduckene.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class summernoteCopy {

	public Map<String, Object> summerCopy(List<String> fileList) throws Exception {

		Map<String, Object> result = new HashMap<String, Object>();

		if(fileList != null ) {
			for (int i = 0; i < fileList.size(); i++) {
				String oriFilePath = "c:/imgduck/temp/" + fileList.get(i);

				// 복사될 파일경로
				String copyFilePath = "c:/imgduck/board/" + fileList.get(i);

				try {
					FileInputStream fis = new FileInputStream(oriFilePath); // 읽을파일
					FileOutputStream fos = new FileOutputStream(copyFilePath); // 복사할파일
					int data = 0;
					while ((data = fis.read()) != -1) {
						fos.write(data);
					}
					fis.close();
					fos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				File delFile = new File(oriFilePath);
				
				if(delFile.exists()) {
					delFile.delete();
				}
				
			}

		}
		result.put("SUCCESS", true);
		return result;
	}
}
