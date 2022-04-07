package com.hamonize.admin.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.print.DocFlavor.URL;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hamonize.admin.user.SecurityUser;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/file")
public class FileController {

    @Value("${attach.path}")
	private String path;

    @Autowired
    private FileService fs;
    
    @Autowired
    private FileRepository fr;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @PostMapping("/upload")
    @ResponseBody
    public String uploadFile(HttpSession session, @RequestParam("keyfile") MultipartFile mFile, FileVO vo) throws IOException {
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
        
        vo.setUserid(user.getUserid());
        logger.info("keytype : {}", vo.getKeytype());
        logger.info("userid : {}", vo.getUserid());


        String result = "";
        Path uploadDir = Paths.get(path);
      
        if(!Files.isDirectory(uploadDir)) {
            Files.createDirectories(uploadDir);
        }
         
        logger.info("path : {}", path);
  
        UUID tmpFileName = UUID.randomUUID(); 
        String originalFileName = mFile.getOriginalFilename();        
        String fileExt = FilenameUtils.getExtension(originalFileName);
        String logicalFileName = tmpFileName.toString()+ "." + fileExt;
        byte[] fileBytes = mFile.getBytes();
        Path filePath = uploadDir.resolve(logicalFileName);
        
        logger.info("originalFileName {}",originalFileName);
        logger.info("logicalFileName {}", logicalFileName);


        vo.setFilename(logicalFileName);
        vo.setFilerealname(originalFileName);
        vo.setFilesize(mFile.getSize());
        vo.setFilepath(filePath.toString());

        if(Files.write(filePath, fileBytes) != null){
            fs.upload(vo);
            result = vo.getFilepath();
        }else{
            result ="F";
        }

        
        return result;
    }

    @PostMapping("/uploadEditorImg")
    @ResponseBody
    public FileVO uploadEditorImg(HttpSession session, @RequestParam("keyfile") MultipartFile mFile, FileVO vo) throws IOException {
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
        
        vo.setUserid(user.getUserid());
        logger.info("keytype : {}", vo.getKeytype());
        logger.info("userid : {}", vo.getUserid());


        FileVO result = new FileVO();
        Path uploadDir = Paths.get(path);
      
        if(!Files.isDirectory(uploadDir)) {
            Files.createDirectories(uploadDir);
        }
         
        logger.info("path : {}", path);
  
        UUID tmpFileName = UUID.randomUUID(); 
        String originalFileName = mFile.getOriginalFilename();        
        String fileExt = FilenameUtils.getExtension(originalFileName);
        String logicalFileName = tmpFileName.toString()+ "." + fileExt;
        byte[] fileBytes = mFile.getBytes();
        Path filePath = uploadDir.resolve(logicalFileName);
        
        vo.setFilename(logicalFileName);
        vo.setFilerealname(originalFileName);
        vo.setFilesize(mFile.getSize());
        vo.setFilepath(filePath.toString());

        if(Files.write(filePath, fileBytes) != null){
            result = fr.save(vo);
        }else{
            result = null;
        }
        return result;

    }


    @PostMapping("/uploadSupportImg")
    @ResponseBody
    public URL uploadFile(HttpServletResponse response, HttpSession session, @RequestParam("keyfile") MultipartFile mFile, FileVO vo) throws IOException {
        SecurityUser user = (SecurityUser) session.getAttribute("userSession");
        
        vo.setUserid(user.getUserid());
        logger.info("keytype : {}", vo.getKeytype());

        String result = "";
        Path uploadDir = Paths.get(path);
      
        if(!Files.isDirectory(uploadDir)) {
            Files.createDirectories(uploadDir);
        }
         
        logger.info("path : {}", path);
  
        UUID tmpFileName = UUID.randomUUID(); 
        String originalFileName = mFile.getOriginalFilename();        
        String fileExt = FilenameUtils.getExtension(originalFileName);
        String logicalFileName = tmpFileName.toString()+ "." + fileExt;
        byte[] fileBytes = mFile.getBytes();
        Path filePath = uploadDir.resolve(logicalFileName);
        
        logger.info("originalFileName {}",originalFileName);
        logger.info("logicalFileName {}", logicalFileName);

        vo.setFilename(logicalFileName);
        vo.setFilerealname(originalFileName);
        vo.setFilesize(mFile.getSize());
        vo.setFilepath(filePath.toString());

        if(Files.write(filePath, fileBytes) != null){
            fs.upload(vo);
            result = vo.getFilepath();
                
            StringBuilder sb = new StringBuilder("file:"+ vo.getFilepath());
            logger.info("sb >> {}",sb);

            URL fileUrl = new URL(sb.toString());
            logger.info("fileUrl >> {}",fileUrl.toString());
            logger.info("fileUrl??  >> {}",fileUrl);

            // IOUtils.copy(fileUrl.openStream(), response.getOutputStream());

        return fileUrl;    

        }else{
            return null;
        }

        // return result;
    }


  
    @PostMapping("/download")
    @ResponseBody
    public String file( FileVO vo, HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
        vo = fr.getBySeq(vo.getSeq());

        File file = new File(vo.getFilepath());
		String ret ="";
       
        if (file.exists() && file.isFile()) {
			response.setContentType("application/octet-stream; charset=utf-8");
			response.setContentLength((int) file.length());
		
            String browser = getBrowser(request);
		    String disposition = getDisposition(file.getName(), browser);
         
            response.setHeader("Content-Disposition", disposition);
			response.setHeader("Content-Transfer-Encoding", "binary");
		
            try {
                
                OutputStream out = response.getOutputStream();
                FileInputStream fis = null;
            
                fis = new FileInputStream(file);
            
                FileCopyUtils.copy(fis, out);
         
                if (fis != null){
                    fis.close();
                }
                
                out.flush();
                out.close();
             
                ret="S";
            } catch (Exception e) {
                logger.error(e.getMessage());
            }
        }else{
            logger.info("파일이 아님");
            ret="F";
        }
        
        return ret;
    }
  

    @PostMapping("/delete")
    @ResponseBody
    public String deleteFile(FileVO vo) throws IOException {
        vo = fr.getBySeq(vo.getSeq());

        String result ="";
        File file = new File(vo.getFilepath());

        if(file.exists()){ 
            if(file.delete()){
                fr.delete(vo);
                result ="S";

            }else{
                logger.info("파일 삭제 실패");
                result ="F";
            }
        }else{ 
            logger.info("파일 없음");
            result ="F";
        }

        return result;
            
    }
  


	private String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if (header.indexOf("MSIE") > -1 || header.indexOf("Trident") > -1)
			return "MSIE";
		else if (header.indexOf("Chrome") > -1)
			return "Chrome";
		else if (header.indexOf("Opera") > -1)
			return "Opera";
		return "Firefox";
	}

	private String getDisposition(String filename, String browser) throws UnsupportedEncodingException {
		String dispositionPrefix = "attachment;filename=";
		String encodedFilename = null;
		
        if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll(
					"\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\""
					+ new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\""
					+ new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			
            for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		}
		return dispositionPrefix + encodedFilename;
	}



}
