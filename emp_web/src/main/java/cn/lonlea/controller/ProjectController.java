package cn.lonlea.controller;

import cn.lonlea.domain.Project;
import cn.lonlea.domain.ProjectFile;
import cn.lonlea.domain.UserInfo;
import cn.lonlea.service.IFileService;
import cn.lonlea.service.IProjectService;
import cn.lonlea.utils.ImgUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.List;

@Controller
@RequestMapping("/projects")
public class ProjectController {
    @Autowired
    private IProjectService projectService;

    @Autowired
    private IFileService fileService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(
            @RequestParam(name = "page",required = true,defaultValue = "1")int page,
            @RequestParam(name = "size",required = true,defaultValue = "5")int size){
        ModelAndView mv = new ModelAndView();
        List<Project> projects = projectService.findAll(page,size);
        //pageinfo就是一个分页bean
        PageInfo projectList = new PageInfo(projects);
        mv.addObject("projectList",projectList);
        mv.setViewName("projects/project_list");
        return mv;
    }

    @RequestMapping("/findByDepartmentId.do")
    @ResponseBody
    public List<Project> findByUsername(String departmentId, HttpServletRequest request){
        List<Project> projects = projectService.findByDepartmentId(departmentId);
        request.getSession().setAttribute("projects",projects);
        return projects;
    }

    @RequestMapping("/addProject.do")
    public String addUser(Project project,String departmentId){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("projects/project_list");
        projectService.addProject(project,departmentId);
        return "redirect:findAll.do?page=1&size=5";
    }

    @RequestMapping("/toEdit.do")
    public ModelAndView toEdit(String id){
        ModelAndView mv = new ModelAndView();
        Project project = projectService.findById(id);
        mv.addObject("projectInfo",project);
        mv.setViewName("projects/project_edit");
        return mv;
    }

    @RequestMapping("/update.do")
    public String update(Project project,String departmentId){
        projectService.update(project,departmentId);
        return "redirect:findAll.do?page=1&size=5";
    }

    @RequestMapping("/delete.do")
    public ModelAndView delete(String id){
        ModelAndView mv = new ModelAndView();
        projectService.delete(id);
        mv.setViewName("projects/project_list");
        return mv;
    }

    @RequestMapping("/findById.do")
    public ModelAndView findById(String id){
        ModelAndView mv = new ModelAndView();
        Project projectInfo = projectService.findById(id);
        List<ProjectFile> files = fileService.findByProjectId(id);

        mv.addObject("projectInfo",projectInfo);
        mv.addObject("fileList",files);
        mv.setViewName("projects/project_info");
        return mv;
    }

    @RequestMapping("/uploadFile.do")
    public ModelAndView uploadFile(@RequestParam("id")String id,
                                   @RequestParam("file") MultipartFile file,
                                   HttpServletRequest request) throws IOException {
        ModelAndView mv = new ModelAndView();
        Project project = projectService.findById(id);
        //文件夹位置
        String rootPath = request.getSession().getServletContext().getRealPath("projects");
        // 原始名称
        String FileName = file.getOriginalFilename();
        // 创建项目
        Calendar date = Calendar.getInstance();
        File projectDirs = new File(project.getProjectName());
        // 新文件
        File newFile = new File(rootPath + File.separator +
                projectDirs + File.separator + FileName);
        // 判断目标文件所在目录是否存在
        if( !newFile.getParentFile().exists()) {
            // 如果目标文件所在的目录不存在，则创建父目录
            newFile.getParentFile().mkdirs();
        }
        System.out.println(newFile);
        // 将内存中的数据写入磁盘
        file.transferTo(newFile);
        // 完整的url

        String fileUrl = project.getProjectName() + "/" + FileName;
        //mv.addObject("path", fileUrl);
        ProjectFile projectFile = new ProjectFile(project.getId(),FileName,fileUrl);
        fileService.save(projectFile);
        mv.setViewName("users/personal_info");
        return mv;
    }

    @RequestMapping("/down.do")
    public void down(String id,HttpServletRequest request,
                     HttpServletResponse response) throws Exception{
        ProjectFile projectFile = fileService.findById(id);
        //模拟文件，myfile.txt为需要下载的文件
        String fileName = request.getSession().getServletContext().
                getRealPath("projects")+"/"+projectFile.getUrl();
        //获取输入流
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
        //假如以中文名下载的话
        String filename = projectFile.getFileName();
        //转码，免得文件名中文乱码
        filename = URLEncoder.encode(filename,"UTF-8");
        //设置文件下载头
        response.addHeader("Content-Disposition", "attachment;filename=" + filename);
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
        response.setContentType("multipart/form-data");
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        int len = 0;
        while((len = bis.read()) != -1){
            out.write(len);
            out.flush();
        }
        out.close();
    }
}
