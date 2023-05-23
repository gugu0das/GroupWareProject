package com.ware.group.util1;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class FileManager extends AbstractView{
   
   @Value("${app.upload}")
   private String path;
   
   @Override
   protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
         HttpServletResponse response) throws Exception {
        
//          File file = new File(path+board,boardFileVO.getFileName());
//          
//          //한글 처리
//          response.setCharacterEncoding("UTF-8");
//          
//          //총 파일의 크기
//          response.setContentLengthLong(file.length());
//          
//          //다운로드시 파일의 이름을 인코딩
//          String oriName = URLEncoder.encode(boardFileVO.getOriName(), "UTF-8");
//          
//          //header 설정
//          response.setHeader("Content-Disposition", "attachment;filename=\""+oriName+"\"");
//          response.setHeader("Content-Transfer-Encoding", "binary");
//          
//          //HDD에서 파일을 읽고
//          FileInputStream fi = new FileInputStream(file);
//          //Client 로 전송 준비
//          OutputStream os = response.getOutputStream();
//          
//          //전송
//          FileCopyUtils.copy(fi, os);
//         
//          //자원 해제
//          os.close();
//          fi.close();

      
   }
   
   //1.HDD에 파일을 저장하고 저장된 ㅇ파일명을 리턴
   public String saveFile(String path, MultipartFile multipartFile)throws Exception{
      //1.File 객체 생성
      File file = new File(path);// 저장할 폴더
      
      if(!file.exists()) {
         file.mkdirs();
      }
      //2. 이름 만들기
      String fileName = multipartFile.getOriginalFilename();
     
      //3. 경로명과 파일명의 정보를 가진 file객체 생성
      
      //path써도 되고 위에 기존 file을 써도됨
      file=new File(file, fileName);
      
      //4.파일을 목적지에 저장
      //FileCopyUtils.copy(multipartFile.getBytes(),file);
      multipartFile.transferTo(file);
      
      return fileName;
   }
}