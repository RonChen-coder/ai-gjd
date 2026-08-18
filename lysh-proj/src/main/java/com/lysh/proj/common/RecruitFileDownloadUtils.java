package com.lysh.proj.common;

import com.wondersgroup.wdls.web.AjaxResult;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.util.UriUtils;

import java.nio.charset.StandardCharsets;

/**
 * 文件下载工具类。
 * 将文件内容写入响应流，并处理下载文件名编码。
 */
public final class RecruitFileDownloadUtils {

    private static final Logger logger = LoggerFactory.getLogger(RecruitFileDownloadUtils.class);

    private RecruitFileDownloadUtils() {
    }

    /**
     * 输出文件到响应流。
     *
     * @param response HTTP响应
     * @param bytes 文件内容
     * @param filename 文件名称
     * @param contentType 文件类型
     * @return 下载失败时返回提示，成功时返回 null
     */
    public static AjaxResult download(HttpServletResponse response, byte[] bytes, String filename, String contentType) {
        try {
            String encodedName = UriUtils.encode(filename, StandardCharsets.UTF_8.name());
            response.setContentType(contentType);
            response.setCharacterEncoding("UTF-8");
            String resultFileName = new String(encodedName.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);
            response.addHeader("Content-Disposition", "attachment;filename=" + resultFileName);
            response.getOutputStream().write(bytes);
            response.getOutputStream().flush();
        } catch (Exception e) {
            logger.error("下载文件失败", e);
            response.addHeader("Err-Msg", e.getMessage());
            return AjaxResult.SUCCESS("下载文件失败");
        }
        return null;
    }
}
