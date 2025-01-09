package com.yupi.mianshiya.model.dto.questionBank;

import lombok.Data;

import java.io.Serializable;

/**
 * 更新题库请求
 *
 * @author <a 小孙</a>
 * @from <a 小孙</a>
 */
@Data
public class QuestionBankUpdateRequest implements Serializable {

    /**
     * id
     */
    private Long id;

    /**
     * 标题
     */
    private String title;

    /**
     * 描述
     */
    private String description;

    /**
     * 图片
     */
    private String picture;

    private static final long serialVersionUID = 1L;
}