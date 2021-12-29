package com.styldle.controller;

import com.styldle.vo.ProductAttachVO;
import com.styldle.vo.QnaAttachFileDTO;
import com.styldle.vo.StyleImgVO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@Slf4j
public class UploadController {
    @GetMapping("/uploadAjax")
    public void uploadAjax(){
        System.out.println("ajax get 이동");
    }

    private String getFolder() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = sdf.format(date);
        return str.replace("-", File.separator);
    }

    private boolean checkImageType(File file) {
        try {
            String contentType= Files.probeContentType(file.toPath());
            return contentType.startsWith("image");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @PostMapping(value = "/uploadAjax", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<List<StyleImgVO>> uploadAjaxPost2(MultipartFile[] uploadFile) {
        List<StyleImgVO> list = new ArrayList<>();
        String uploadFolder = "C:\\upload";

        String uploadFolderPath = getFolder();
        // make folder
        File uploadPath = new File(uploadFolder, uploadFolderPath);
        log.info("upload path: " + uploadPath);
        if (uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }

        // make yyyy/MM/dd folder
        for (MultipartFile multipartFile : uploadFile) {
            StyleImgVO attachDTO = new StyleImgVO();
            String uploadFileName = multipartFile.getOriginalFilename();
            attachDTO.setFileName(uploadFileName);

            UUID uuid = UUID.randomUUID();
            uploadFileName = uuid.toString() + "_" + uploadFileName;

            try {
                File saveFile = new File(uploadPath, uploadFileName);
                multipartFile.transferTo(saveFile);

                attachDTO.setUuid(uuid.toString());
                attachDTO.setUploadPath(uploadFolderPath);
                System.out.println(attachDTO);
                // check image type file
                if (checkImageType(saveFile)) {
                    FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
                    Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 450, 450);
                    thumbnail.close();
                    // add to List
                    list.add(attachDTO);
                }
            } catch (Exception e) {
                log.error(e.getMessage());
            }
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @PostMapping(value = "/uploadAjaxProduct", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<List<ProductAttachVO>> uploadAjaxProductPost(MultipartFile[] uploadFile){

        List<ProductAttachVO> list = new ArrayList<>();
        String uploadFolder = "C:\\upload";
        String uploadFolderPath = getFolder();

        //make folder
        File uploadPath = new File(uploadFolder, uploadFolderPath);
        if(uploadPath.exists() == false) {
            uploadPath.mkdirs(); //make yyyy/MM/dd folder
        }

        for(MultipartFile multipartFile : uploadFile){
            System.out.println("업로드 File Name : "+multipartFile.getOriginalFilename());
            System.out.println("업로드 File Size : "+multipartFile.getSize());

            ProductAttachVO attachDTO = new ProductAttachVO();
            String uploadFileName = multipartFile.getOriginalFilename();
            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
            System.out.println("File Name : "+uploadFileName);
            attachDTO.setFileName(uploadFileName);

            //UUID
            UUID uuid = UUID.randomUUID();
            uploadFileName = uuid.toString()+"_"+uploadFileName;

            try {
                File saveFile = new File(uploadPath, uploadFileName);
                multipartFile.transferTo(saveFile);

                attachDTO.setUuid(uuid.toString());
                attachDTO.setUploadPath(uploadFolderPath);

                FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
                Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
                thumbnail.close();

                list.add(attachDTO);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<List<QnaAttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile){
        List<QnaAttachFileDTO> list = new ArrayList<>();

        String uploadFolder = "C:\\upload";
        String uploadFolderPath = getFolder();
        // make folder
        File uploadPath = new File(uploadFolder, getFolder());
        log.info("업로드 경로: "+uploadPath);

        if(uploadPath.exists() == false){
            uploadPath.mkdirs();
        }
        //make yyyy/MM/dd folder
        for (MultipartFile multipartFile: uploadFile){
            log.info("-------------------------");
            log.info("Upload File Name: "+multipartFile.getOriginalFilename());
            log.info("Upload File Size: "+multipartFile.getSize());

            QnaAttachFileDTO attachDTO = new QnaAttachFileDTO();
            String uploadFileName = multipartFile.getOriginalFilename();

            //IE has file path
            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
            log.info("only file name: "+ uploadFileName);
            attachDTO.setFileName(uploadFileName);

            UUID uuid = UUID.randomUUID();

            uploadFileName = uuid.toString()+ "_" + uploadFileName;

            try{
                File saveFile = new File(uploadPath, uploadFileName);
                multipartFile.transferTo(saveFile);

                attachDTO.setUuid(uuid.toString());
                attachDTO.setUploadPath(uploadFolderPath);

                //check image type file
                if(checkImageType(saveFile)){

                    attachDTO.setImage(true);

                    FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+ uploadFileName));
                    Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail,100,100);
                    thumbnail.close();
                }
                list.add(attachDTO);
            }catch (Exception e){
                log.error(e.getMessage());
            }
        } //end For
        return new ResponseEntity<>(list, HttpStatus.OK);
    }
    @PostMapping(value = "/QnaUploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<List<QnaAttachFileDTO>> uploadAjaxPost3(MultipartFile[] uploadFile){
        List<QnaAttachFileDTO> list = new ArrayList<>();

        String uploadFolder = "C:\\upload";
        String uploadFolderPath = getFolder();
        // make folder
        File uploadPath = new File(uploadFolder, getFolder());
        log.info("업로드 경로: "+uploadPath);

        if(uploadPath.exists() == false){
            uploadPath.mkdirs();
        }
        //make yyyy/MM/dd folder
        for (MultipartFile multipartFile: uploadFile){
            log.info("-------------------------");
            log.info("Upload File Name: "+multipartFile.getOriginalFilename());
            log.info("Upload File Size: "+multipartFile.getSize());

            QnaAttachFileDTO attachDTO = new QnaAttachFileDTO();
            String uploadFileName = multipartFile.getOriginalFilename();

            //IE has file path
            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
            log.info("only file name: "+ uploadFileName);
            attachDTO.setFileName(uploadFileName);

            UUID uuid = UUID.randomUUID();

            uploadFileName = uuid.toString()+ "_" + uploadFileName;

            try{
                File saveFile = new File(uploadPath, uploadFileName);
                multipartFile.transferTo(saveFile);

                attachDTO.setUuid(uuid.toString());
                attachDTO.setUploadPath(uploadFolderPath);

                //check image type file
                if(checkImageType(saveFile)){

                    attachDTO.setImage(true);

                    FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+ uploadFileName));
                    Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail,100,100);
                    thumbnail.close();
                }
                list.add(attachDTO);
            }catch (Exception e){
                log.error(e.getMessage());
            }
        } //end For
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    //이미지 데이터 전송
    @GetMapping("/display")
    @ResponseBody
    public ResponseEntity<byte[]> getFile(String fileName){
        File file = new File("c:\\upload\\" + fileName);
        ResponseEntity<byte[]> result = null;
        try {
            HttpHeaders header = new HttpHeaders();
            header.add("Content-type", Files.probeContentType(file.toPath()));
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,
                    HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // 파일 다운로드
    @GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    @ResponseBody
    public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent")String userAgent, String fileName){
        System.out.println("downloadFile: "+ fileName);

        Resource resource = new FileSystemResource("c:\\upload\\"+ fileName);
        System.out.println("resource: "+ resource);

        if(resource.exists()== false){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        String resourceName = resource.getFilename();

        //remove UUID
        String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
        HttpHeaders headers = new HttpHeaders();
        try{
            String downloadName= null;
            downloadName = new String(resourceOriginalName.getBytes("UTF-8"),"ISO-8859-1");
            headers.add("Content-Disposition", "attachment; filename="+downloadName);

        }catch (UnsupportedEncodingException e){
            e.printStackTrace();
        }
        return new ResponseEntity<Resource>(resource,headers,HttpStatus.OK);
    }

    @PostMapping("/deleteFile")
    @ResponseBody
    public ResponseEntity<String> deleteFile(String fileName, String type){
        log.info("deletFile: " + fileName);
        File file;
        try {
            file = new File("c:\\upload\\" + URLDecoder.decode(fileName,"UTF-8"));
            file.delete();
            if(type.equals("image")) {
                String largeFileName = file.getAbsolutePath().replace("s_", "");
                file = new File(largeFileName);
                file.delete();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }

    @PostMapping("/deleteImage")
    @ResponseBody
    public ResponseEntity<String> deleteImage(String fileName){
        File file;
        try {
            file = new File("c:\\upload\\" + URLDecoder.decode(fileName,"UTF-8"));
            file.delete();
            String largeFileName = file.getAbsolutePath().replace("s_", "");
            file = new File(largeFileName);
            file.delete();
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }
}
