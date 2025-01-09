package com.yupi.mianshiya.constant;

public interface RedisConstant {
    /**
     * 用户签到 redis 的前缀 key
     */
    String USER_SIGN_IN_REDIS_KEY_PREFIX = "user:singins";

    /**
     * 获取用户签到的redis key
     * @param year 年份
     * @param userId 用户id
     * @return 拼接好的 Redis key
     */
    static String getUserSignInRedisKeyPrefix(int year, long userId){
        return String.format("%s:%s:%S", USER_SIGN_IN_REDIS_KEY_PREFIX, year, userId);
    }
}
