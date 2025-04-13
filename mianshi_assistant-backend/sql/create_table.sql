# 数据库初始化


-- 创建库
create database if not exists visen;

-- 切换库
use visen;

-- 用户表
create table if not exists user
(
    id           bigint auto_increment comment 'id' primary key,
    userAccount  varchar(256)                           not null comment '账号',
    userPassword varchar(512)                           not null comment '密码',
    unionId      varchar(256)                           null comment '微信开放平台id',
    mpOpenId     varchar(256)                           null comment '公众号openId',
    userName     varchar(256)                           null comment '用户昵称',
    userAvatar   varchar(1024)                          null comment '用户头像',
    userProfile  varchar(512)                           null comment '用户简介',
    userRole     varchar(256) default 'user'            not null comment '用户角色：user/admin/ban',
    editTime     datetime     default CURRENT_TIMESTAMP not null comment '编辑时间',
    createTime   datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime   datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete     tinyint      default 0                 not null comment '是否删除',
    index idx_unionId (unionId)
) comment '用户' collate = utf8mb4_unicode_ci;

-- 题库表
create table if not exists question_bank
(
    id          bigint auto_increment comment 'id' primary key,
    title       varchar(256)                       null comment '标题',
    description text                               null comment '描述',
    picture     varchar(2048)                      null comment '图片',
    userId      bigint                             not null comment '创建用户 id',
    editTime    datetime default CURRENT_TIMESTAMP not null comment '编辑时间',
    createTime  datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime  datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete    tinyint  default 0                 not null comment '是否删除',
    index idx_title (title)
) comment '题库' collate = utf8mb4_unicode_ci;

-- 题目表
create table if not exists question
(
    id         bigint auto_increment comment 'id' primary key,
    title      varchar(256)                       null comment '标题',
    content    text                               null comment '内容',
    tags       varchar(1024)                      null comment '标签列表（json 数组）',
    answer     text                               null comment '推荐答案',
    userId     bigint                             not null comment '创建用户 id',
    editTime   datetime default CURRENT_TIMESTAMP not null comment '编辑时间',
    createTime datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete   tinyint  default 0                 not null comment '是否删除',
    index idx_title (title),
    index idx_userId (userId)
) comment '题目' collate = utf8mb4_unicode_ci;

-- 题库题目表（硬删除）
create table if not exists question_bank_question
(
    id             bigint auto_increment comment 'id' primary key,
    questionBankId bigint                             not null comment '题库 id',
    questionId     bigint                             not null comment '题目 id',
    userId         bigint                             not null comment '创建用户 id',
    createTime     datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime     datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    UNIQUE (questionBankId, questionId)
) comment '题库题目' collate = utf8mb4_unicode_ci;




insert into question (title, content, tags, answer, userId)
values
-- 数据结构
('什么是栈？它的主要应用有哪些？',
 '请简要说明栈的定义以及常见的使用场景。',
 '["数据结构", "基础"]',
 '栈是一种先进后出（LIFO）的数据结构，常用于函数调用、表达式求值、括号匹配等场景。',
 1),

('链表与数组的区别有哪些？',
 '从存储结构、访问方式等方面分析链表和数组的区别。',
 '["数据结构", "链表", "数组"]',
 '数组在内存中连续存储，支持随机访问；链表通过指针连接节点，插入删除效率更高但不支持随机访问。',
 1),

-- 操作系统
('什么是线程？线程与进程有什么区别？',
 '请说明线程的概念，并与进程做出对比。',
 '["操作系统", "线程", "进程"]',
 '线程是程序执行的最小单位，一个进程可以包含多个线程。线程共享进程资源，切换开销更小。',
 2),

('操作系统中发生死锁的条件是什么？',
 '请列出导致死锁发生的四个必要条件。',
 '["操作系统", "死锁"]',
 '互斥、占有且等待、不可剥夺、循环等待。',
 2),

-- 网络
('请解释 TCP 的三次握手过程。',
 '详细描述 TCP 在建立连接时的三次握手过程。',
 '["网络", "TCP"]',
 '第一次客户端发送 SYN，第二次服务端返回 SYN+ACK，第三次客户端发送 ACK，连接建立。',
 2),

('简述 TCP 和 UDP 的区别。',
 '从连接方式、可靠性、传输效率等方面比较 TCP 与 UDP。',
 '["网络", "协议"]',
 'TCP 面向连接，传输可靠但效率低；UDP 无连接，传输快但不可靠。',
 2),

-- Java
('Java 中的 HashMap 是如何实现的？',
 '请简述 HashMap 的底层数据结构和基本原理。',
 '["Java", "集合", "基础"]',
 'HashMap 通过数组+链表（JDK8后为链表+红黑树）实现，使用哈希函数定位桶，冲突时拉链法解决。',
 2),

('什么是 Java 中的异常处理机制？',
 'Java 中 try-catch-finally 的作用分别是什么？',
 '["Java", "异常"]',
 'try 块用于捕获可能抛出异常的代码，catch 用于处理异常，finally 总会执行，常用于资源释放。',
 2),

-- 数据库
('请解释数据库事务的四大特性。',
 '数据库事务具有什么基本特性？',
 '["数据库", "事务"]',
 '原子性、一致性、隔离性、持久性，简称 ACID。',
 3),

('什么是范式？第三范式的定义是什么？',
 '简要介绍数据库范式，特别是第三范式。',
 '["数据库", "范式"]',
 '范式是设计关系型数据库表的规范。第三范式要求非主属性不依赖于其他非主属性。',
 3);
insert into question (title, content, tags, answer, userId)
values
    ('Java中关于反射的常见问题有哪些？', '请简要说明反射相关的概念和应用。', '["Java", "反射"]', '反射是Java中常见的知识点，常用于相关技术问题的分析与解决。', 2),
    ('操作系统中关于线程的常见问题有哪些？', '请简要说明线程相关的概念和应用。', '["操作系统", "线程"]', '线程是操作系统中常见的知识点，常用于相关技术问题的分析与解决。', 1),
    ('网络中关于IP协议的常见问题有哪些？', '请简要说明IP协议相关的概念和应用。', '["网络", "IP协议"]', 'IP协议是网络中常见的知识点，常用于相关技术问题的分析与解决。', 1),
    ('网络中关于TCP的常见问题有哪些？', '请简要说明TCP相关的概念和应用。', '["网络", "TCP"]', 'TCP是网络中常见的知识点，常用于相关技术问题的分析与解决。', 3),
    ('数据结构中关于哈希表的常见问题有哪些？', '请简要说明哈希表相关的概念和应用。', '["数据结构", "哈希表"]', '哈希表是数据结构中常见的知识点，常用于相关技术问题的分析与解决。', 2),
    ('数据库中关于事务的常见问题有哪些？', '请简要说明事务相关的概念和应用。', '["数据库", "事务"]', '事务是数据库中常见的知识点，常用于相关技术问题的分析与解决。', 2),
    ('操作系统中关于死锁的常见问题有哪些？', '请简要说明死锁相关的概念和应用。', '["操作系统", "死锁"]', '死锁是操作系统中常见的知识点，常用于相关技术问题的分析与解决。', 2),
    ('Java中关于线程的常见问题有哪些？', '请简要说明线程相关的概念和应用。', '["Java", "线程"]', '线程是Java中常见的知识点，常用于相关技术问题的分析与解决。', 3),
    ('Java中关于集合的常见问题有哪些？', '请简要说明集合相关的概念和应用。', '["Java", "集合"]', '集合是Java中常见的知识点，常用于相关技术问题的分析与解决。', 3),
    ('数据结构中关于栈的常见问题有哪些？', '请简要说明栈相关的概念和应用。', '["数据结构", "栈"]', '栈是数据结构中常见的知识点，常用于相关技术问题的分析与解决。', 3),

    ('数据库中关于SQL的常见问题有哪些？', '请简要说明SQL相关的概念和应用。', '["数据库", "SQL"]', 'SQL是数据库中常见的知识点，常用于相关技术问题的分析与解决。', 3),
    ('数据库中关于视图的常见问题有哪些？', '请简要说明视图相关的概念和应用。', '["数据库", "视图"]', '视图是数据库中常见的知识点，常用于相关技术问题的分析与解决。', 1),
    ('Java中关于异常的常见问题有哪些？', '请简要说明异常相关的概念和应用。', '["Java", "异常"]', '异常是Java中常见的知识点，常用于相关技术问题的分析与解决。', 1),
    ('操作系统中关于调度的常见问题有哪些？', '请简要说明调度相关的概念和应用。', '["操作系统", "调度"]', '调度是操作系统中常见的知识点，常用于相关技术问题的分析与解决。', 3),
    ('数据结构中关于队列的常见问题有哪些？', '请简要说明队列相关的概念和应用。', '["数据结构", "队列"]', '队列是数据结构中常见的知识点，常用于相关技术问题的分析与解决。', 1),
    ('Java中关于面向对象的常见问题有哪些？', '请简要说明面向对象相关的概念和应用。', '["Java", "面向对象"]', '面向对象是Java中常见的知识点，常用于相关技术问题的分析与解决。', 2),
    ('数据结构中关于链表的常见问题有哪些？', '请简要说明链表相关的概念和应用。', '["数据结构", "链表"]', '链表是数据结构中常见的知识点，常用于相关技术问题的分析与解决。', 2),
    ('数据库中关于范式的常见问题有哪些？', '请简要说明范式相关的概念和应用。', '["数据库", "范式"]', '范式是数据库中常见的知识点，常用于相关技术问题的分析与解决。', 1),
    ('操作系统中关于内存管理的常见问题有哪些？', '请简要说明内存管理相关的概念和应用。', '["操作系统", "内存管理"]', '内存管理是操作系统中常见的知识点，常用于相关技术问题的分析与解决。', 2),
    ('网络中关于UDP的常见问题有哪些？', '请简要说明UDP相关的概念和应用。', '["网络", "UDP"]', 'UDP是网络中常见的知识点，常用于相关技术问题的分析与解决。', 3),

    ('网络中关于HTTP的常见问题有哪些？', '请简要说明HTTP相关的概念和应用。', '["网络", "HTTP"]', 'HTTP是网络中常见的知识点，常用于相关技术问题的分析与解决。', 1),
    ('Java中关于反射的使用场景有哪些？', '请简要说明反射的常见应用场景。', '["Java", "反射"]', '反射是Java中用于动态访问类和方法的机制，常用于框架开发。', 3),
    ('数据库中关于索引优化的常见问题有哪些？', '请简要说明索引优化相关的概念和应用。', '["数据库", "索引"]', '索引优化可以提升查询效率，是数据库调优的关键环节。', 2),
    ('操作系统中关于多线程的常见问题有哪些？', '请简要说明多线程相关的概念和应用。', '["操作系统", "线程"]', '多线程用于提高程序并发性，但需要注意线程安全和资源竞争。', 2),
    ('网络中关于DNS的常见问题有哪些？', '请简要说明DNS相关的概念和应用。', '["网络", "DNS"]', 'DNS用于将域名转换为IP地址，是网络通信的重要组成部分。', 2),
    ('数据结构中关于图的常见问题有哪些？', '请简要说明图相关的概念和应用。', '["数据结构", "图"]', '图是数据结构中用于表示节点关系的结构，常用于路径搜索、社交网络等。', 1),
    ('数据库中关于事务隔离级别的常见问题有哪些？', '请简要说明事务隔离级别的作用。', '["数据库", "事务"]', '事务隔离级别决定多个事务之间数据访问的可见性，常见有四种级别。', 1),
    ('Java中关于集合框架的常见问题有哪些？', '请简要说明集合框架的结构与用途。', '["Java", "集合"]', 'Java集合框架包括List、Set、Map等，适用于各种数据存储场景。', 2),
    ('操作系统中关于文件系统的常见问题有哪些？', '请简要说明文件系统相关的基本知识。', '["操作系统", "文件系统"]', '文件系统负责管理磁盘文件的组织和访问，是操作系统的重要部分。', 3),
    ('数据结构中关于树的常见问题有哪些？', '请简要说明树结构的定义与应用。', '["数据结构", "树"]', '树是一种层级结构，常用于表示组织结构、解析表达式等。', 1),
    ('Java中关于异常处理机制的常见问题有哪些？', '请简要说明异常处理的工作原理。', '["Java", "异常"]', 'Java异常处理通过try-catch-finally块实现，保证程序健壮性。', 1),
    ('数据库中关于连接查询的常见问题有哪些？', '请简要说明多表连接的用法与优化。', '["数据库", "SQL"]', '连接查询用于多个表的数据合并，常见有内连接、外连接、交叉连接。', 3),
    ('操作系统中关于虚拟内存的常见问题有哪些？', '请简要说明虚拟内存的作用与机制。', '["操作系统", "内存管理"]', '虚拟内存通过地址映射提高内存利用率，支持内存交换和分段分页。', 1),
    ('网络中关于三次握手的常见问题有哪些？', '请简要说明TCP连接建立的过程。', '["网络", "TCP"]', '三次握手用于建立可靠连接，确保双方准备就绪并同步初始序列号。', 3),
    ('Java中关于线程池的常见问题有哪些？', '请简要说明线程池的使用场景与原理。', '["Java", "线程"]', '线程池可重用线程资源，适用于高并发下的任务管理。', 2),
    ('数据结构中关于优先队列的常见问题有哪些？', '请简要说明优先队列的定义与用途。', '["数据结构", "队列"]', '优先队列按优先级排序出队，常用于调度系统和图算法。', 2),
    ('数据库中关于事务ACID的常见问题有哪些？', '请简要说明事务四大特性。', '["数据库", "事务"]', 'ACID 指原子性、一致性、隔离性、持久性，是事务的核心特性。', 1),
    ('操作系统中关于上下文切换的常见问题有哪些？', '请简要说明上下文切换的过程和开销。', '["操作系统", "进程"]', '上下文切换是CPU在多个进程之间切换的过程，频繁切换会影响性能。', 2);
