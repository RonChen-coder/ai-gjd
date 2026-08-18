package com.wondersgroup.shrs.admin.policy.bpo;

import com.wondersgroup.shrs.admin.meeting.model.FileModel;
import org.springframework.web.multipart.MultipartFile;

public interface PubAdminPolicyFileBPO {

    FileModel findFileModel(String fileId);

    String savePolicyWj(MultipartFile fileUpload);

}
