package com.we.controller;

import com.we.bean.Friend;
import com.we.common.OurConstants;
import com.we.common.Pager;
import com.we.common.PathUtils;
import com.we.enums.RequestResultEnum;
import com.we.service.FriendService;
import com.we.vo.RequestResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/friend")
public class FriendController {

    private FriendService friendService;

    @PostMapping("save")
    @ResponseBody
    public RequestResultVO save(Friend friend, MultipartFile file) {
        RequestResultVO vo = null;
        try{
            String imgPath = PathUtils.mkUploadImgs();
            file.transferTo(new File(imgPath, file.getOriginalFilename()));
            friend.setImgpath(OurConstants.PERFIX_IMG_PATH + friend.getImgpath());
            friendService.save(friend);
            vo = RequestResultVO.status(RequestResultEnum.SAVE_SUCCESS);
        }catch (IOException e) {
            vo = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.SAVE_FAIL);
        }
        return vo;
    }

    @RequestMapping("update_pager")
    @ResponseBody
    public RequestResultVO updatePager(Friend friend) {
        RequestResultVO vo = null;
        try{
            friendService.updateSelective(friend);
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
        }catch (RuntimeException e) {
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return vo;
    }

    @PostMapping("update")
    @ResponseBody
    public RequestResultVO update(Friend friend,MultipartFile file) {
        RequestResultVO vo = null;
        try {
            friend.setFid(friend.getFid());
            if (!friend.getImgpath().equals("")) {
                String imgPath = PathUtils.mkUploadImgs();
                file.transferTo(new File(imgPath, file.getOriginalFilename()));
                friend.setImgpath(OurConstants.PERFIX_IMG_PATH + friend.getImgpath());
            }
            friendService.updateSelective(friend);
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_SUCCESS);
        } catch (IOException e) {
            e.printStackTrace();
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        } catch (RuntimeException e) {
            e.printStackTrace();
            vo = RequestResultVO.status(RequestResultEnum.UPDATE_FAIL);
        }
        return vo;
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(Long offset,Long limit,Friend friend) {
        return friendService.listAllLetter(offset,limit,friend);
    }

    @RequestMapping("list_friend")
    @ResponseBody
    public List<Friend> listFriend() {
        List<Friend> friends = friendService.listFriend();
        return friends;
    }

    @Resource
    public void setFriendService(FriendService friendService) {
        this.friendService = friendService;
    }



}
