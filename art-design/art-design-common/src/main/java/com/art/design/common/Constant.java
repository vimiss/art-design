package com.art.design.common;

import java.math.RoundingMode;

/**
 * Description： <br/>
 * Copyright (C), 2010-2020, gfzhang <br/>
 * This program is protected by copyright laws. <br/>
 * Program Name: Constant.java <br/>
 * Date: 2011-4-13
 * 
 * @author jack
 * @version 1.0
 */
public class Constant {

	String ELOANCN="温州翼龙贷经济信息咨询有限公司";
	String ELOANCN_NEW="北京同城翼龙网络科技有限公司";
	String ELOANCN_AREA="温州市";
	String ELOANCN_NEW_AREA="北京市";
	Integer TIME_SEPARATE=1434060000;//时间分隔点
	
	String ELOANCN_TEL="400-080-5055";
	
	String LOGIN_SESSION_NAME = "member";
	String ADMIN_LOGIN_SESSION_NAME = "adminUser";
    String SUSER_LOGIN_SESSION_NAME = "suser";	
	String LOGIN_REDIRECT_PATH = "targetUrl";
	
	String HEADPHOTO_REDIRECT_PATH = "headPhotoUrl";
	String CREDIT_MIN_LEVEL = "D";  //会员信用默认等级
	
	Integer sendMobileCodeOutTime = 180;//发送手机验证码的时间
	/**
	 * 合同编号数字默认长度 
	 */
	int HT_NUM_LEN = 6;
	
	String AUTHEN_SESSION_MOBILE_CODE = "mobilecode";
	String AUTHEN_SESSION_MOBILE = "mobile"; 
//	String KEY ="123456";
	String KEY ="j4612kd";
	String FINDPWD_SESSION_MOBILE_CODE = "findpwdmobilecode";//找回密码（session中存放的手机验证码）
	String FINDPWD_SESSION_MOBILE = "findpwdmobile";//找回密码（session中存放的手机号码）
	String FINDPWD_SESSION_MOBILE_CDATE = "findpwdcdate";//找回密码（session中存放的发送时间）
	String FINDPWD_SESSION_EMAIL_CODE = "findpwdemailcode";//找回密码（session中存放的邮箱验证码）
	String FINDPWD_SESSION_EMAIL = "findpwdemail";//找回密码（session中存放的邮箱）
	String FINDPWD_SESSION_SAFEQUESTION = "findpwdsafequestion";//找回密码（session中存放的密保问题用户）

	String FINDPAYPWD_SESSION_MOBILE_CODE = "findpaypwdmobilecode";//找回支付密码（session中存放的手机验证码）
	String FINDPAYPWD_SESSION_MOBILE = "findpaypwdmobile";//找回支付密码（session中存放的手机号码）
	String FINDPAYPWD_SESSION_MOBILE_CDATE = "findpaypwdcdate";//找回支付密码（sesion中存放的发送时间）
	String FINDPAYPWD_SESSION_EMAIL_CODE = "findpaypwdemailcode";//找回支付密码（session中存放的邮箱验证码）
	String FINDPAYPWD_SESSION_EMAIL = "findpaypwdemail";//找回支付密码（session中存放的邮箱）
	String FINDPAYPWD_SESSION_SAFEQUESTION = "findpaypwdsafequestion";//找回支付密码（session中存放的密保问题用户）
	
	String CHANGE_BANK_CARD_MOBILE = "changebankcardmobile";//手机修改银行卡号的手机号
	String CHANGE_BANK_CARD_MOBILE_CODE = "changebankcardmobilecode";//手机修改银行卡号的验证码
	String CHANGE_BANK_CHRD_MOBILE_CDATE = "changebankmobilecdate";//手机修改银行卡号的发送手机号码时间
	String CHANGE_BANK_CARD_EMAIL = "changebankcardemail";//邮箱修改银行卡号的邮箱地址
	String CHANGE_BANK_CARD_EMAIL_CODE = "changebankcardemailcode";//邮箱修改银行卡号的验证码

	String REMOVELOCK_SESSION_MOBILE="removelocksessionmobile";//解锁时的手机号码
	String REMOVELOCK_SESSION_MOBILE_CODE="removelocksessionmobilecode";//解锁时的手机验证码
	String REMOVELOCK_SESSION_MOBILE_CDATE="removelocksessionmobilecdate";//发送验证码的时间
	String REMOVElOCK_SESSION_EMAIL="removelocksessionmobilecdate";//解锁时的邮箱
	String REMOVElOCK_SESSION_EMAIL_CODE="removelocksessionemailcode";//邮箱解锁时的验证码
	String REMOVElOCK_SESSION_EMAIL_CDATE="removelocksessionemailcdate";//邮箱解锁时发送验证码的时间
	
	/**
	 * 支付密码相关
	 */
	String CHANGE_PAYPASSWORD_MOBILE_CODE="changeitembymobileCode";//通过手机号修改支付密码时的验证码
	String CHANGE_PAYPASSWORD_Email_CODE="changeitembyemailcode";//通过邮箱修改支付密码时的验证码
	String CHANGE_PAYPASSWORD_MOBILE_CDATE ="changepaypasswordmobilecdate";//手机修改支付密码的发送手机号码时间
	/**
	 * 手机号相关
	 */
	String CHANGE_MOBILE_MOBILE_CODE="changemobilemobilecode";//通过原手机号修改手机号码
	String CHANGE_MOBILE_EMAIL_CODE="changemobileemailcode";//通过邮箱修改手机号码
	String CHANGE_MOBILE_MOBILE_CDATE ="changemobilemobilecdate";//手机修改支付密码的发送手机号码时间
	
	Integer GET_CHECKCODE_MOBILE=1;//通过手机获取的验证码
	Integer GET_CHECKCODE_EMAIL=2;//通过邮箱获取验证码
	Integer GET_CHECKCODE_MOBILE_SOUND=3;//通过手机获取语音验证吗
	
	String CHANGE_MOBILE_CDATE = "changemobilecdate";//修改手机号时，session中存放的时间
	
	/**
	 * 提现申请验证码发送时间
	 */
	String WITHDRAW_CDATE = "withdrawcdate";
	String WITHDRAW_CODE="withdrawcode";
	
	/*
	 * 用户状态
	 */
	byte USER_STATUS_NORMAL = 1;   //正常状态
	byte USER_STATUS_LOCK = 2;     //锁定状态
	public static final byte USER_STATUS_FREEZING = 3; //冻结状态
	byte USER_STATUS_LOGOUT = 4;   //注销状态
	byte USER_STATUS_DUBIOUS=5;    //异常登录锁定状态
	
	/*
	 * 总部后台操作区域ID
	 */
	public static final int USER_AREAID_HQ = 0;
	
	/*
	 * 日志 ---操作类型定义
	 */
	byte OPERATE_TYPE_ADD = 1; // 增加
	byte OPERATE_TYPE_EDIT = 2; // 修改
	byte OPERATE_TYPE_DEL = 3; // 删除
	byte OPERATE_TYPE_ENABLE = 4; // 启用
	byte OPERATE_TYPE_DISABLE = 5; // 禁用
	byte OPERATE_TYPE_CHECK = 6; // 审核
	byte OPERATE_TYPE_ADJUST = 7; // 调整
	byte OPERATE_TYPE_OTHER = 0; // 其它

	/**
	 * 投标状态定义:成功
	 */
	public static final int TENDER_STATUS_SUCCESS = 1; // 成功
	
	/**
	 * 投标状态定义:部分成功
	 */
	public static final int TENDER_STATUS_PART_SUCCESS = 2; // 部分成功
	
	/**
	 * 投标状态定义:流标
	 */
	public static final int TENDER_STATUS_BIDS = 3; // 流标

	/*
	 * 人与人关系类型
	 */
	byte RELATION_TYPE_CONTACT = 0; // 普通联系人
	byte RELATION_TYPE_GOODFRIEND = 1; // 挚友
	byte RELATION_TYPE_KINDRED = 2; // 亲属
	byte RELATION_TYPE_CLASSMATE = 3; // 同学
	byte RELATION_TYPE_COLLEAGUE = 4; // 同事
	byte RELATION_TYPE_FRIEND = 5; // 普通朋友
	byte RELATION_TYPE_LOANFRIEND = 6; // 贷友
	byte RELATION_TYPE_MEET = 7; // 几面之缘
	byte RELATION_TYPE_OTHER = 8; // 其它

	/*
	 * 用户角色
	 */
	byte MEMBER_ROLE_LENDER = 1; // 放款人
	byte MEMBER_ROLE_USURER = 2; // 贷款人
	byte MEMBER_ROLE_ALL = 3; // 既是放款人又是借款人
	
	byte MEMBER_ROLE_LENDER_AUTH = 10;//伪放款人
	byte MEMBER_ROLE_USURER_AUTH = 20;//伪贷款人
	/*
	 * 用户类型
	 */
	byte MEMBER_TYPE_COMMON = 1; // 普通会员
	byte MEMBER_TYPE_DIAMOND = 2; // 钻石会员
	byte MEMBER_TYPE_GOLD = 3; // 金牌VIP会员
	byte MEMBER_TYPE_SILVER = 4; // 银牌VIP会员
	byte MEMBER_TYPE_BRONZE = 5; // 铜牌VIP会员
	byte MEMBER_TYPE_IRON = 6; // 铁牌VIP会员
	byte MEMBER_TYPE_TEST = 7;//测试账户
	byte MEMBER_TYPE_BIG = 8;//大客户

	/*
	 * 用户表里家族激活状态
	 */
	byte MEMBER_STATUS_SIMPLE = 0; // 未激活
	byte MEMBER_STATUS_LENDING = 1; // 已激活

	/**翼存宝通知*/
	public static final String NOTICE_YLB_PRODUCT_DUE = "NOTICE_YLB_PRODUCT_DUE";//翼存宝产品到期
	public static final String NOTICE_EXPERIENCE_YLB_PRODUCT_DUE = "NOTICE_EXPERIENCE_YLB_PRODUCT_DUE";//翼存宝体验期产品到期
	public static final String NOTICE_YLB_BUY_SUCCESS = "NOTICE_YLB_BUY_SUCCESS";//翼存宝产品购买成功
	public static final String NOTICE_YLB_FORWARD_SH = "NOTICE_YLB_FORWARD_SH";//翼存宝产品提前赎回
	public static final String NOTICE_YLB_HX = "NOTICE_YLB_HX";//翼存宝产品还息
	public static final String NOTICE_YLB_KSJX = "NOTICE_YLB_KSJX";//翼存宝理财产品开始计息

	/***
	 * 翼存宝体验金活动类型
	 * */
	public static final int EXPERIENCE_WMPS_TYPE_ZERO=0;//2015年春节活动翼存宝体验金
	public static final int EXPERIENCE_WMPS_TYPE_ONE=1;//2015年6月份活动翼存宝体验金
	
	/**
	 * 文件上传默认路径
	 */
	public static final String UPLOAD_DEFAULT = "uploads";// 文件的默认路径
	/**
	 * 用户上传资料未审核
	 */
	public static final byte CHECK_STATUS_NO = 0;
	/**
	 * 用户上传资料审核为属实
	 */
	public static final byte CHECK_STATUS_TRUE = 1;
	/**
	 * 用户上传资料审核为造假
	 */
	public static final byte CHECK_STATUS_FALSE = 2;
	
	/**
	 * 全部状态
	 */
	public static final byte CHECK_STATUS_ALL = 120;

	/**
	 * 标的模式 :竞标
	 */
	public static final int TENDER_MODE_COMPTENDER = 1;// 竞标(标的模式)
	
	/**
	 * 标的模式 :满标
	 */
	public static final int TENDER_MODE_FULLTENDER = 2;// 满标(标的模式)
	/**
	 * 标的模式 :大额
	 */
	public static final int TENDER_MODE_LARGTENDER = 3;// 大额(标的模式)
	
	
	/**
	 * 用于标类型判断
	 */
	public static final int TENDER_TYPE_JUDGE =100;
	
	/**
	 * 标的类型
	 */
	public static final int TENDER_TYPE_COMMTENDER = 1;// 普通标(标的类型)
	public static final int TENDER_TYPE_DAFETENDER = 2;// 安全标(标的类型)
	public static final int TENDER_TYPE_PREFTENDER = 3;// 优惠标(标的类型)
	public static final int TENDER_TYPE_PUBLICCREDIT = 4;// 公益贷(标的类型)
	public static final int TENDER_TYPE_GUARANTEE = 5;//担保标
	public static final int TENDER_TYPE_RECOMMEND = 6;//推荐标
	public static final int TENDER_TYPE_RECOMMEND_HOME = 7;//推送首页标
	public static final int TENDER_TYPE_RECOMMEND_AND_HOME = 8;//既是推荐标又是推送首页标
	public static final int TENDER_TYPE_NOWITHDRAW = 9;//非提现标
	public static final int TENDER_TYPE_NOWITHDRAW_AND_RECOMMEND = 10;//既是非提现标又是推荐标
	public static final int TENDER_TYPE_NOWITHDRAW_AND_RECOMMENT_HOME = 11;//既是非提现标又是推送首页标
	public static final int TENDER_TYPE_NOWITHDRAW_AND_RECOMMENT_AND_HOME = 12;//既是非提现标又是推荐标又是推送首页标
	public static final int TENDER_TYPE_TO_CJD = 13;//专门给财经道的标
	public static final int TENDER_TYPE_GUARANTEE_FOR_CAR = 14;//车担保
	public static final int TENDER_TYPE_GUARANTEE_FOR_HOUSE = 15;//房担保
	public static final int TENDER_TYPE_GUARANTEE_FOR_CAR_HOUSE = 16;//既是车抵押又是房抵押标
	public static final int TENDER_TYPE_NEW_USER_TENDER = 18;//新手标
	public static final int TENDER_TYPE_TO_WMPS = 17;//理财包
	public static final int TENDER_TYPE_REFINANCE_TENDER = 19;//续贷标
	public static final int TENDER_TYPE_ORDER_TENDER = 20;//预约标
	public static final int TENDER_TYPE_DD_TENDER = 21;//DD借款
	public static final int TENDER_TYPE_ENTERPRISE_TENDER = 22;//翼企贷标 
	public static final int TENDER_TYPE_CAR_TENDER = 24;//翼车贷标
	public static final int TENDER_TYPE_NONG_TENDER = 25;//翼农贷 
	public static final int TENDER_TYPE_SHANG_TENDER = 26;//翼企贷标 
	public static final int TENDER_TYPE_GUARANTEE_FOR_HOUSE_DQ = 27;//房抵标（定期）
	public static final int TENDER_TYPE_LBD_TENDER = 28;//联保贷
	/**
	 * 标的状态
	 */
	public static final int TENDER_PUBLISH_STATUS_WAIT = 0;// 尚未发布(标的状态)
	public static final int TENDER_PUBLISH_STATUS_NORMAL = 1;// 进行中(标的状态)
	public static final int TENDER_PUBLISH_STATUS_SUCCESS = 2;// 成功(标的状态)
	public static final int TENDER_PUBLISH_STATUS_FAIL = 3;// 流标(标的状态)
	public static final int TENDER_PUBLISH_STATUS_WITHDRAW = 4;// 已撤回(标的状态)
	public static final int TENDER_PUBLISH_STATUS_LOCKED = 5;// 锁定(标的状态)
	public static final int TENDER_PUBLISH_STATUS_WAIT_FOR_EXAMINATION = 6;// 待审(标的状态)
	public static final int TENDER_PUBLISH_STATUS_REPAID = 7;// 已还清(标的状态)
	public static final int TENDER_PUBLISH_STATUS_FRANCHISEE_AUDIT = 8;//加盟商已审核通过
	public static final int TENDER_PUBLISH_STATUS_STAY_FIRST_TRIAL = 9;//待初审（加盟商）
	public static final int TENDER_PUBLISH_STATUS_FIRST_TRIAL_FAIL = 10;//初审未通过（加盟商）
	public static final int TENDER_PUBLISH_STATUS_STAY_SECOND_TRIAL = 11;//待初审（总部）
	public static final int TENDER_PUBLISH_STATUS_WAIT_FOR_USER_ENSURE = 12;//待用户确认
	public static final int TENDER_PUBLISH_STATUS_WAIT_FOR_FINAL_CHECK = 13;//等待总部最终审核
	public static final int TENDER_PUBLISH_STATUS_WAIT_USER_ENSURE_ADMIN_UPDATE = 14;//等待用户确认管理员修改
	
	public static final int ORDERBYTIME = 1;// 按照时间顺序查找标
	public static final int ORDERBYOPTIME = 2;// 按照时间逆序查找标
	public static final int ORDERBYAMOUNT = 3;// 按照金额顺序查找标
	public static final int ORDERBYRATE = 4;// 按照利率查找标

	/**
	 * 用户请求未受理
	 */
	public static final int NOT_ACCEPT = 0;
	/**
	 * 用户请求受理通过
	 */
	public static final int ACCEPTED_THROUGH = 1;
	/**
	 * 用户请求受理未通过
	 */
	public static final int ACCEPTED_NOT_THROUGH = 2;

	/*
	 * 举报类型
	 */
	int REPORT_TYPE_1 = 1;// 此用户在其他网站有借款
	int REPORT_TYPE_2 = 2;// 此用户乱发骚扰信息
	int REPORT_TYPE_3 = 3;// 此用户冒用他人身份
	int REPORT_TYPE_4 = 4;// 怀疑此人有虚假信息
	int REPORT_TYPE_5 = 5;// 其他/此用户发表了不当语言或图片

	/**
	 * 页面条件常量
	 */
	public static final int PAGE_CONDITION_ZERO = 0;
	public static final int PAGE_CONDITION_ONE = 1;
	public static final int PAGE_CONDITION_TWO = 2;
	public static final int PAGE_CONDITION_THREE = 3;
	public static final int PAGE_CONDITION_FOUR = 4;
	public static final int PAGE_CONDITION_FIVE = 5;
	public static final int PAGE_CONDITION_SIX = 6;
	public static final int PAGE_CONDITION_SEVEN = 7;
	public static final int PAGE_CONDITION_EIGHT = 8;
	public static final int PAGE_CONDITION_NINE = 9;
	public static final int PAGE_CONDITION_TEN = 10;
	public static final int PAGE_CONDITION_ELEVEN = 11;
	public static final int PAGE_CONDITION_TWELVE = 12;
	public static final int PAGE_CONDITION_THIRTEEN = 13;
	public static final int PAGE_CONDITION_FOURTEEN = 14;
	
	
	/**
	 * 还款方式 : 等额本金
	 */
	public static final int REPAYMENT_TYPE_MATCHING_PRINCIPAL = 1;
	
	/**
	 * 还款方式 : 等额本息
	 */
	public static final int REPAYMENT_TYPE_MATCHING_INTEREST = 2;
	
	/**
	 * 还款方式 : 还本付息
	 */
	public static final int REPAYMENT_TYPE_REPAY_CAPITAL_WITH_INTEREST = 3;
	
	/**
	 * 还款时间方式 : 未还
	 */
	public static final int REPAYMENT_TIME_TYPE_NO_REPAY = 0;
	
	/**
	 * 还款时间方式 : 按期还款
	 */
	public static final int REPAYMENT_TIME_TYPE_EVERY_PHASE = 1;
	
	/**
	 * 还款时间方式 : 一次性付清
	 */
	public static final int REPAYMENT_TIME_TYPE_ALL_IN_ONE = 2;
	
	/**
	 * 还款时间方式 : 逾期系统自动划账
	 */
	public static final int REPAYMENT_TIME_TYPE_OVERDUE_AUTO_DEDUCTION = 3;
	/**
	 * 还款时间方式 : 逾期情况下偿还部分本金
	 */
	public static final int REPAYMENT_TIME_TYPE_OVERDUE_PORINT_DEDUCTION = 4;
	
	/**
	 * 还款状态 : 已还
	 */
	public static final int REPAYMENT_STATUS_REPAID = 1;
	
	/**
	 * 还款状态 : 待还
	 */
	public static final int REPAYMENT_STATUS_WILL_REPAY = 2;
	
	/**
	 * 还款状态 : 逾期
	 */
	public static final int REPAYMENT_STATUS_OVERDUE = 3;
	
	/**
	 * 还款状态 : 延期
	 */
	public static final int REPAYMENT_STATUS_EXTENSION = 4;
	
	/**
	 * 还款状态 : 提前还款
	 */
	public static final int REPAYMENT_STATUS_EARLY = 5;
	
	/**
	 * 还款状态 : 逾期已还
	 */
	public static final int REPAYMENT_STATUS_OVERDUE_REPAID = 6; 
	
	public static final int TENDER_AMOUNT_SCOPE_FIVE_HUNDRED = 500;
	public static final int TENDER_AMOUNT_SCOPE_ONE_THOUSAND = 1000;
	public static final int TENDER_AMOUNT_SCOPE_THREE_THOUSAND = 3000;//总金额范围
	public static final int TENDER_AMOUNT_SCOPE_FIVE_THOUSAND = 5000;
	public static final int TENDER_AMOUNT_SCOPE_TEN_THOUSAND = 10000;
	public static final int TENDER_AMOUNT_SCOPE_TWENTY_THOUSAND = 20000;
	public static final int TENDER_AMOUNT_SCOPE_FIFTY_THOUSAND = 50000;
	public static final int TENDER_AMOUNT_SCOPE_TEN_HUNDRED_THOUSAND = 100000;
	public static final int TENDER_AMOUNT_SCOPE_TWENTY_HUNDRED_THOUSAND = 200000;
	public static final int TENDER_AMOUNT_SCOPE_ONE_MILLION = 1000000;
	
	public static final double TENDER_RATE_ONE = 0.01;//年利率
	public static final double TENDER_RATE_FIVE = 0.05;
	public static final double TENDER_RATE_TEN = 0.10;
	public static final double TENDER_RATE_ELEVEN = 0.11;
	public static final double TENDER_RATE_TWELVE = 0.12;
	public static final double TENDER_RATE_THIRTEEN = 0.13;
	public static final double TENDER_RATE_FIFTEEN = 0.15;
	public static final double TENDER_RATE_SIX = 0.16;
	public static final double TENDER_RATE_EIGHTEEN = 0.18;
	public static final double TENDER_RATE_TWENTY = 0.20;

	
	public static final int RECHARGE_NOACCEPT = 0;// 线下充值未受理（受理状态）
	public static final int RECHARGE_ACCEPTED = 1;// 线下充值受理通过（受理状态）
	public static final int RECHARGE_ACCEPTNOTHROUGH = 2;// 线下充值受理未通过（受理状态）
	
	//债权转让列表
	public static final int CREDITASSIGNMENT_RESEARCH_NOT_OVERDUE = 1;//未逾期
	public static final int CREDITASSIGNMENT_RESEARCH_OVERDUE = 2;//逾期
	
	public static final int CREDITASSIGNMENT_COUNT_NO_OVERDUE = 0;//没有逾期
	
	/**************************用户分类信息****************************/
	/**
	 * 用户婚姻状况
	 */
	public static final byte USER_MARITAL_STATUS = 1;
	/**
	 * 用户借贷记录 (5年以上 、3-5年 、1-3年、1年（含）以下)等
	 */
	public static final byte USER_LOAN_RECORD = 2;
	/**
	 * 个人贷款或信用卡违约 （不曾违约、曾违约1-2次、曾违约3次（含以上））等
	 */
	public static final byte USER_LOAN_DEFAULT = 3;
	/**
	 * 房屋所在地 (城市居住区、城镇社区、商业社区、农村居住区、其它居住区)等
	 */
	public static final byte USER_HOUSING_LOCATION = 4;
	/**
	 * 教育程度(硕士研究生或以上、本科、专科、高中（中专）、初中或初中以下)等
	 */
	public static final byte USER_EDUCATION = 5;
	/**
	 * 职业 （事业单位员工、金融机构（不含保险公司））等
	 */
	public static final byte USER_PROFESSIONAL = 6;
	/**
	 * 年收入（含配偶）合计所得40万元以上 合计所得30-39万元等
	 */
	public static final byte USER_ANNUAL_INCOME = 7;
	/**
	 * 职称 （高级管理人员、总公司总经理、中校以上、中级管理人员、公司或分公司总经理）等
	 */
	public static final byte USER_WORK_TITLE = 8;
	/**
	 * 工作年限 (5年以上、3-5年（含）、1-3年（含）1年以下（含）)等
	 */
	public static final byte USER_WORK_EXPERIENCE = 9;
	/**
	 * 您（配偶）或家人名下是否有房屋土地等不动产
	 */
	public static final byte USER_REAL_ESTATE = 10;
	/**
	 * 借款用途
	 */
	public static final byte USER_LOAN_USE = 11;
	/**
	 * 参加/缴纳社会保险的年限
	 */
	public static final byte USER_INSURANCE_PERIOD = 12;
	/**
	 * 是否购买/参保商业保险
	 */
	public static final byte USER_COMMERCIAL_INSURANCE = 13;
	/**
	 * 是否有车
	 */
	public static final byte USER_A_CAR = 14;
	/**
	 * 信用额度最高的银行
	 */
	public static final byte USER_BESTCREDIT_BANK = 15;
	/**
	 * 信用额度
	 */
	public static final byte USER_CREDIT = 16;
	
	/**
	 * 冻结资金类型 1:放款
	 */
	public static final byte FREEZING_FUNDS_FREEZING_TYPE_LENDING_DEPOSIT = 1;
	
	/**
	 * 冻结资金类型 2:风险保证金
	 */
	public static final byte FREEZING_FUNDS_FREEZING_TYPE_SECURITY_DEPOSIT = 2;
	
	/**
	 * 冻结资金类型 3:参加竞拍
	 */
	public static final byte FREEZING_FUNDS_FREEZING_TYPE_AUCTION = 3;
	
	/**
	 * 冻结资金类型 4:逾期未还款
	 */
	public static final byte FREEZING_FUNDS_FREEZING_TYPE_OVERDUE = 4;
	/**
	 * 冻结资金类型 5:提现
	 */
	public static final byte FREEZING_FUNDS_FREEZING_TYPE_WITHDRAW = 5;
	/**
	 * 冻结资金类型 6:购买理财产品
	 */
	public static final byte FREEZING_FUNDS_FREEZING_TYPE_BUY_WMPS = 6;
	/**
	 * 冻结资金类型 7：垫付不足标金额
	 */
	public static final byte FREEZING_FUNDS_FREEZING_TYPE_DF_SY_TENDER = 7;
	/**
	 * 冻结资金类型 8：垫付赎回产品
	 */
	public static final byte FREEZING_FUNDS_FREEZING_TYPE_DF_SH = 8;
	/**
	 * 冻结资金类型 9:预约投标
	 */
	public static final byte FREEZING_FUNDS_FREEZING_TYPE_ORDERTENDER = 9;
	/**
	 * 冻结资金类型10：购买翼星计划产品 - 保障星部分
	 */
	public static final byte FREEZING_FUNDS_FREEZING_TYPE_BUY_WUT_A = 10;
	/**
	 * 冻结资金类型11：翼星计划标放款，冻结状态
	 */
	public static final byte FREEZING_FUNDS_FREEZING_TYPE_WUT_TENDER_AMOUNT = 11;
	/**
	 * 冻结资金类型12：购买翼星计划产品 - 收益星部分
	 */
	public static final byte FREEZING_FUNDS_FREEZING_TYPE_BUY_WUT_B = 12;
	
	/**
	 * 冻结资金状态 1:冻结
	 */
	public static final byte FREEZING_FUNDS_FREEZING_STATUS_FREEZING = 1;
	
	/**
	 * 冻结资金状态 2:解冻
	 */
	public static final byte FREEZING_FUNDS_FREEZING_STATUS_THAW = 2;
	
	/**
	 * 收入、支出类型： 1 线上充值
	 */
	public static final byte FUNDS_INFO_TYPE_ONLINE_RECHARGE = 1;
	
	/**
	 * 收入、支出类型： 2 线下充值
	 */
	public static final byte FUNDS_INFO_TYPE_OFFLINE_RECHARGE = 2;
	/**
	 * 收入、支出类型： 3 还款
	 */
	public static final byte FUNDS_INFO_TYPE_REPAYMENT = 3;
	
	/**
	 * 收入、支出类型： 4 放款
	 */
	public static final byte FUNDS_INFO_TYPE_LENDING = 4;
	
	/**
	 * 收入类型： 5  贷款成功 划账
	 */
	public static final byte FUNDS_INFO_TYPE_LEND_SUCCESS = 5;
	
	/**
	 * 支出类型： 6  扣除成交网站服务费
	 */
	public static final byte FUNDS_INFO_TYPE_SERVICE_CHARGES = 6;
	
	/**
	 * 支出类型： 7  提现
	 */
	public static final byte FUNDS_INFO_TYPE_WITHDRAW = 7;
	
	/**
	 * 收入类型： 8 收款
	 */
	public static final byte FUNDS_INFO_TYPE_COLLECT = 8;
	
	/**
	 * 收入类型：9 解冻资金
	 */
	public static final byte FUNDS_INFO_TYPE_UNFREEZE = 9;
	
	/**
	 * 支出类型：10身份证认证扣款
	 */
	public static final byte FUNDS_INFO_TYPE_IDCARD_AUTH = 10;

	/**
	 * 支出类型：11学历认证扣款
	 */
	public static final byte FUNDS_INFO_TYPE_DIPLOMA_AUTH = 11;
	
	/**
	 * 支出类型：12视频认证扣款
	 */
	public static final byte FUNDS_INFO_TYPE_VIDEO_AUTH = 12;
	
	/**
	 * 支出类型：13 债权转让成交服务费
	 */
	public static final byte FUNDS_INFO_TYPE_CREDITASSIGN_CHARGES = 13;
	
	/**
	 * 收入类型：14 债权转让成交金额
	 */
	public static final byte FUNDS_INFO_TYPE_CREDITASSIGN = 14;
	
	/**
	 * 支出类型：15 购买债权
	 */
	public static final byte FUNDS_INFO_TYPE_BUYCREDITASSIGNMENT = 15;
	
	/**
	 * 支出类型：16 主动撤销债权转让违约金
	 */
	public static final byte FUNDS_INFO_TYPE_CREDITASSIGN_PENALTY = 16;
	
	/**
	 * 支出类型：17 到期未还款账户 支付违约金
	 */
	public static final byte FUNDS_INFO_TYPE_OVERDUE_WYJ= 17;
	
	/**
	 * 支出类型：18 到期未还款账户 支付罚息
	 */
	public static final byte FUNDS_INFO_TYPE_OVERDUE_FX= 18;
	
	/**
	 * 支出类型：19 到期未还款账户 支付超息（还款日期超出最后一期还款时间应付的正常利息）
	 */
	public static final byte FUNDS_INFO_TYPE_OVERDUE_CX= 19;
	
	/**
	 * 收入类型：20 提现申请未通过，资金返还到用户账户
	 */
	public static final byte FUNDS_INFO_TYPE_WITHDRAWBACK = 20;
	
	/**
	 * 支出类型：21 在线充值手续费
	 */
	public static final byte FUNDS_INFO_TYPE_ONLINE_RECHARGE_FEE = 21;
	
	/**
	 * 管理员调整额度
	 */
	public static final byte FUNDS_INFO_TYPE_ADMIN_ADJUST = 22;
	
	/**
	 * 扣除担保标的费用
	 */
	public static final byte FUNDS_INFO_TYPE_GUARANTEE_FEE = 23;
	
	/**
	 * 贷出管理费(贷出者财富管理费)
	 */
	public static final byte FUNDS_INFO_TYPE_SERVICE_LEND_FEE = 24;
	
	/**
	 * 贷出损失准备金
	 */
	public static final byte FUNDS_INFO_TYPE_LOAN_INSURE = 25;
	
	/**
	 * 家访费
	 */
	public static final byte FUNDS_INFO_TYPE_FAMILY_VISIT_CHART = 26;
	
	/**
	 * 税费代扣代缴(贷出)
	 */
	public static final byte FUNDS_INFO_TYPE_SERVICE_LEND_TAX_FEE = 27;
	/**
	 * 推荐活动奖励
	 */
	public static final byte FUNDS_INFO_TYPE_TASK_RECOMMEND=28;
	
	/**
	 * 支出类型 29：扣除短信订制业务费用
	 */
	public static final Integer FUNDS_INFO_TYPE_MESSAGE_SERVICE_OPEN=29;
	
	/**
	 * 收入、支出类型30：充值卡充值
	 */
	public static final byte FUNDS_INFO_TYPE_GIFTCARD_RECHARGE = 30;
	
	/**
	 * 收入类型31  运营商垫付充值
	 */
	public static final byte FUNDS_INFO_TYPE_PLATFORM_ADJUST = 31;
	
	/**
	 * 收入类型 32 注册投资红包奖励
	 */
	public static final byte FUNDS_INFO_TYPE_REGISTER_GRANT=32;
	
	/**
	 * 八月活动奖励
	 */
	public static final byte FUNDS_INFO_TYPE_ACTIVITY_AWARD = 33;//活动奖励
	/**
	 * 财经道红包奖励
	 */
	public static final byte FUNDS_INFO_TYPE_CJD_GRANT = 34;//财经道红包奖励
	
	/**
	 * 支出类型 38 ：购买理财产品
	 */
	public static final byte FUNDS_INFO_TYPE_BUY_WMPS = 38;
	/**
	 * 收入类型39：返还购买理财产品的本金
	 */
	public static final byte FUNDS_INFO_TYPE_WMPS_RETURN_BJ = 39;
	/**
	 * 收入类型40: 购买理财产品的利息
	 */
	public static final byte FUNDS_INFO_TYPE_WMPS_RETURN_LX = 40;
	/**
	 * 收入类型41: 赎回理财产品
	 */
	public static final byte FUNDS_INFO_TYPE_WMPS_RETURN_SH = 41;
	/**
	 * 支出类型42: 扣除违约金
	 */
	public static final byte FUNDS_INFO_TYPE_WMPS_PAY_WYJ = 42;//扣除违约金
	/**
	 * 支出类型43: 垫付标剩余金额
	 */
	public static final byte FUNDS_INFO_TYPE_WMPS_PAY_DF_SY_TENDER = 43;
	
	public static final byte FUNDS_INFO_TYPE_AGENT_DBF = 44;//运营商担保费
	
	public static final byte FUNDS_INFO_TYPE_ORDER_TENDER_UNFREEZE = 45;//预约投标金额的解冻
	
	public static final byte FUNDS_INFO_TYPE_BANK_BAK_SXF = 46;//提现-银行退单手续费
	
	/**
	 * 支出类型50: 连连支付
	 */
	public static final byte FUNDS_INFO_TYPE_LL_ZHIFU=50;//手机充值-连连支付
	
	/**
	 * 代扣人寿保险费
	 */
	public static final byte FUNDS_INFO_TYPE_PREMIUM = 51; //代扣人寿保险费
	
	public static final byte FUNDS_INFO_TYPE_WARRANT =52;//担保人身份校验费用
	
	/**
	 * 李龙龙  2015-9-23
	 */
	public static final byte FUNDS_INFO_TYPE_LBD =54;//联保人身份校验费用
	
	/**
	 * 翼星计划产品部分流水类型
	 */
	public static final byte FUNDS_INFO_TYPE_WUT_BUY_A = 61;//购买翼星计划产品(保障星)
	public static final byte FUNDS_INFO_TYPE_WUT_FAIL_A = 62;//购买翼星计划产品失败(保障星)
	public static final byte FUNDS_INFO_TYPE_WUT_INCOME_A_INTER = 63;//收取保障部分的利息
	public static final byte FUNDS_INFO_TYPE_WUT_INCOME_A_PRINCIPAL = 64;//收取保障部分的本金
	public static final byte FUNDS_INFO_TYPE_WUT_OUT_COST = 65;//翼星计划借款人服务费用
	public static final byte FUNDS_INFO_TYPE_WUT_INCOME_COST = 66;//系统账户收取翼星计划借款人服务费用 
	public static final byte FUNDS_INFO_TYPE_WUT_INCOME_B_PRINCIPAL = 67;//收取收益部分的本金
	public static final byte FUNDS_INFO_TYPE_WUT_INCOME_B_INTER = 68;//收取收益部分的利息
	public static final byte FUNDS_INFO_TYPE_WUT_BUY_B = 69;//购买翼星计划产品(收益星)
	public static final byte FUNDS_INFO_TYPE_WUT_FAIL_B = 70;//购买翼星计划产品失败(收益星)
	public static final byte FUNDS_INFO_TYPE_WUT_SYS_DF = 71;//系统垫付
	public static final byte FUNDS_INFO_TYPE_WUT_TENDER_FAIL_PAY = 72;//翼星计划标流标还款支出
	
	/**
	/**
	 * 翼企贷驻企尽调费流水类型   程伟龙 2015-06-11
	 */
	public static final byte FUNDS_INFO_TYPE_YQD_INFO_RELEASE = 75;//翼企贷信息发布费
	/**
	 * 管理员调整用户余额  -- 加操作
	 */
	public static int FUNDS_INFO_OPERATETYPE_ADD = 1;
	
	/**
	 * 管理员调整用户余额  -- 减操作
	 */
	public static int FUNDS_INFO_OPERATETYPE_REDUCE = 2;
	
	/**
	 * 用户资金流水关联标ID为null时的值
	 */
	public static int FUNDS_INFO_TID_NULL = 0;
	
	/**
	 * 认证结果 投标资格未通过
	 */
	public static int AUTH_RESULT_LENDER_QUAL_FAILURE = 1;
	/**
	 * 认证结果 余额不足
	 */
	public static int AUTH_RESULT_LENDER_BALANCE_NOT_ENOUGH = 2;
	/**
	 * 支付密码错误
	 */
	public static int AUTH_RESULT_LENDER_PAYMENT_PASSWORD_ERROR = 3;
	/**
	 * 支付密码未设置
	 */
	public static int AUTH_RESULT_LENDER_NO_PAYMENT_PASSWORD = 4;
	/**
	 * 标已结束
	 */
	public static int AUTH_RESULT_LENDER_END = 5;
	/**
	 * 投标额超过设定的最大值
	 */
	public static int AUTH_RESULT_LENDER_OVERMAX = 6;
	/**
	 * 投标额小于设定的最小值
	 */
	public static int AUTH_RESULT_LENDER_LOWMIN = 7;
	
	/**
	 * 未设置身份证号
	 */
	public static int AUTH_RESULT_LENDER_NOIDCARD=8;
	/**
	 * 未设置银行卡号
	 */
	public static int AUTH_RESULT_LENDER_NOACCOUNT=9;
	
	
	/**
	 * 借入者资格紧急联系人
	 */
	public static String AUTH_BORROWER_QUAL_CREDIT_INFO_CONTACT = "AUTH_BORROWER_QUAL_CREDIT_INFO_CONTACT";
	
	/**
	 * 系统参数:最低投标额度
	 */
	public static final String SYS_PARAMETER_MIN_TENDER_AMOUNT = "MIN_TENDER_AMOUNT";
	
	/**
	 * 系统参数:最高年利率
	 */
	public static final String SYS_PARAMETER_MAX_TENDER_INTREST_RATE = "MAX_TENDER_INTREST_RATE";
	/**
	 * 系统参数:满标资格向下浮动率
	 */
	public static final String SYS_PARAMETER_TENDER_FULL_SCALE_FLOAT_DOWN_RATE = "TBMZBL";
	/**
	 * 系统参数:线上充值转账费比例
	 */
	public static final String SYS_PARAMETER_ONLINE_RECHARGE_FEE = "ONLINE_RECHARGE_FEE";
	/**
	 * 系统参数:是否启用标的初审功能
	 */
	public static final String IS_TENDER_FIRST_TRIAL = "IS_TENDER_FIRST_TRIAL";
	/**
	 * 系统参数：用户确认电子借条时效天数
	 */
	public static final String USER_ENSURE_TENDER_ELECTRONLOAN_TIMES = "USER_ENSURE_TENDER_ELECTRONLOAN_TIMES";
	
	/**
	 * 系统参数：翼星计划用户确认电子借条时效天数
	 */
	public static final String USER_ENSURE_WUT_TENDER_ELECTRONLOAN_TIMES = "USER_ENSURE_WUT_TENDER_ELECTRONLOAN_TIMES";
	/**
	 * 系统参数：提现最低额度
	 */
	public static final String MIN_WITHDRAW_MONEY = "MIN_WITHDRAW_MONEY";
	/**
	 * 贷出者是否收取充值手续费
	 */
	public static final String RECHARGE_LENDER_IS_FREE = "RECHARGE_LENDER_IS_FREE";
	/**
	 * 加盟商查看自有放款人的额度限制
	 */
	public static final String LOAD_LENDER_MAX_AMOUNT = "LOAD_LENDER_MAX_AMOUNT";
	
	/**
	 * 排序---升序
	 */
	public static final String SORT_ASC = "asc";
	/**
	 * 排序---降序
	 */
	public static final String SORT_DESC = "desc";
	/**
	 * 页面页码
	 */
	public static final int PAGE_NUM_ZERO = 0;
	public static final int PAGE_NUM_ONE = 1;
	
	public static final RoundingMode ROUNDING_MODE = RoundingMode.HALF_UP;
	
	/**
	 * 站内信状态
	 */
	byte MESSAGE_STATES_UNREAD = 1; // 未读
	byte MESSAGE_STATES_READ = 2; // 已读
	byte MESSAGE_STATES_SENT = 3; // 已发
	byte MESSAGE_STATES_DEL = 4; // 删除
	int MESSAGE_SENDER_SYSTEMID = 0; //系统站内信ID
	
	/**
	 * 网络认证项目id
	 */
	byte UID_IDCARD = 1; // 身份证认证
	byte UID_MOBILE = 2; // 手机认证
	byte UID_DIPLOMA = 4; // 学历认证
	byte UID_VIDEO= 5; // 视频认证
	byte UID_DRIVER = 6; // 驾驶证认证
	byte UID_VEHICLE = 7; // 行驶证认证
	byte UID_RESIDENCE = 8; // 户口簿认证
	byte UID_TAOBAO = 9; // 淘宝用户认证
	byte UID_BANK=10;//银行卡号
	
	byte WITHDRAW_APPAY_NOTDEAL = 0;  //提现申请未受理
	byte WITHDRAW_APPAY_DEALED = 1;   //提现申请终审受理通过
	byte WITHDRAW_APPAY_REJECT = 2;   //提现申请未通过
	byte WITHDRAW_APPAY_FIRST_DEALED = 3; //提现申请初审通过
	byte WITHDRAW_APPAY_ERROR = 4;   //提现申请支付异常

	
	/**
	 * 借贷标收款状态
	 */
	int TENDER_COLLECT_STATUS_RECEIVED = 1;	//已收
	public static int TENDER_COLLECT_STATUS_WAIT = 2;	//待收
	int TENDER_COLLECT_STATUS_EARLY = 5;	//提前收款
	int TENDER_COLLECT_STATUS_CREDITASSIGN = 6;	//债权已成功转让
	int TENDER_COLLECT_STATUS_ONCREDITASSIGN = 7;	//债权已发布转让

	/**
	 * 信用大类状态
	 */
	byte CREDITTYPE_STATUS_ENABLE = 1; //启用
	byte CREDITTYPE_STATUS_DISABLE = 2; // 禁用
	int USER_CREDIT_NOTCHECKED = 1; //用户信用未审核
	int USER_CREDIT_CHECKED = 2;   //用户信用已审核
	int USER_CREDIT_LOCK = 3;	//用户信用禁用
	
	/**
	 * 页默认行数
	 */
	public static int PAGE_DUFAULT_ROWS = 10;
	
	public static int GROUPSPAGE_ROWS = 8;
	
	/**
	 * 一小时的秒数
	 */
	public static int SECONDS_OF_ONE_HOURS = 60 * 60;
	/**
	 * 一天的秒数
	 */
	public static int SECONDS_OF_ONE_DAY = 24 * 60 * 60;
	/**
	 * 30分钟的秒数
	 */
	public static int SECONDS_OF_30MiNUTE = 30 * 60;
	
	/**
	 * 一天的毫秒数
	 */
	public static long MILLISECONDS_OF_ONE_DAY = 24 * 60 * 60 * 1000L;
	
	/**
	 * 一个月的毫秒数
	 */
	public static long MILLISECONDS_OF_ONE_MONTH = 30 * 24 * 60 * 60 * 1000L;
	
	/**
	 * 标列表显示的行数
	 */
	public static int TENDER_LIST_PAGE_ROWS = 25;

	/**
	 * 资金说明:按月还款
	 */
	public static String FUNDSINFO_DESCRIPTION_REPAYMENT_BY_EVERY_PHASE = "按月还款";
	/**
	 * 资金说明:提前偿还部分本金
	 */
	public static String FUNDSINFO_DESCRIPTION_REPAYMENT_BY_PORINT_MONEY = "提前偿还部分本金";
	/**
	 * 资金说明:收款
	 */
	public static String FUNDSINFO_DESCRIPTION_COLLECT = "收款";
	
	/**
	 * 资金说明:还款
	 */
	public static String FUNDSINFO_DESCRIPTION_REPAYMENT = "还款";
	
	/**
	 * 资金说明:身份认证费用
	 */
	public static String FUNDSINFO_DESCRIPTION_IDCARDAUTHEN = "身份认证费用";
	
	/**
	 * 资金说明:学历认证费用
	 */
	public static String FUNDSINFO_DESCRIPTION_DIPLOMAAUTHEN = "学历认证费用";
	
	/**
	 * 资金说明:视频认证费用
	 */
	public static String FUNDSINFO_DESCRIPTION_VIDEOAUTHEN = "视频认证费用";
	
	/**
	 * 资金说明:在有人竞标的情况下，撤销债权转让违约金
	 */
	public static String FUNDSINFO_DESCRIPTION_CREDITASSIGN_PENALTY = "撤销债权转让违约金";
	/**
	 * 额度调整类型--对应表d_user_limit_record的operatetype字段
	 */
	byte LIMIT_ADJUST_OPERATETYPE_LENT = 1;  //借款
	byte LIMIT_ADJUST_OPERATETYPE_PAY = 2;  //还款
	byte LIMIT_ADJUST_OPERATETYPE_GUARANTEE = 3;  //为朋友担保借款
	byte LIMIT_ADJUST_OPERATETYPE_FRIENDPAY = 4;  //朋友还款
	byte LIMIT_ADJUST_OPERATETYPE_TEMP_APPLY = 5;  //临时额度申请调整
	byte LIMIT_ADJUST_OPERATETYPE_TEMP_EXPIRE = 6;  //临时额度调整到期
	byte LIMIT_ADJUST_OPERATETYPE_RETURN = 7;  //标未成功返还额度
	byte LIMIT_ADJUST_OPERATETYPE_AUDIT_CHANGE = 8;  //信用变更
	byte LIMIT_ADJUST_OPERATETYPE_SYSTEM_CREDIT_CHANGE = 9;  //系统信用分值调整
	
	/**
	 * 自动投标任务类型
	 */
	int AUTO_TENDER_TASK_TYPE_AUTOTENDER = 1;//自动投标条件
	int AUTO_TENDER_TASK_TYPE_NEWTENDER = 2;//新发布的标
	
	/**
	 * 自动投标任务状态
	 */
	int AUTO_TENDER_TASK_STATUS_NEW = 1;//新建
	int AUTO_TENDER_TASK_STATUS_FINISHED = 2;//完成
	
	/**
	 * 自动投标任务开启状态
	 */
	int AUTO_TENDER_TASK_STOP = 0;//停用
	int AUTO_TENDER_TASK_START = 1;//开启
	
	/**
	 * 自动投标参与方式
	 */
	int AUTO_TENDER_METHOD_CONDITION=0;// 条件投标
	int AUTO_TENDER_MEHTO_DOLLAR=1;// 足额投标
	
	/**
	 * 好友状态
	 */
	int FRIENDS_STATUS_NORMAL = 1;//正常
	int FRIENDS_STATUS_UNCONFIRMED = 2;//待验证
	
	/**
	 * 黑名单类型
	 */
	int BLACKLIST_TYPE_SYSTEM = 1;//系统设置
	int BLACKLIST_TYPE_PERSONAL = 2;//个人设置
	
	/**
	 * 后台设置黑名单用户ID
	 */
	int BLACKLIST_UID = 0;
	
	/**
	 * 增额申请物品类别
	 */
	int INCREASEQUOTA_GOODSTYPE_PEOPLE = 1;//人
	int INCREASEQUOTA_GOODSTYPE_CAR = 2;//车
	int INCREASEQUOTA_GOODSTYPE_HOUSE = 3;//房
	
	/**
	 * 增额申请状态
	 */
	int INCREASEAUOTA_STATUS_WAITE = 0;//未受理
	int INCREASEAUOTA_STATUS_HQ_ACCEPT = 1;//（总部）审核通过
	int INCREASEAUOTA_STATUS_HQ_NOPASS = 2;//（总部）审核未通过
	int INCREASEAUOTA_STATUS_FRANCHISEE_ACCEPT = 3;//（加盟商）受理通过
	int INCREASEAUOTA_STATUS_FRANCHISEE_NOPASS = 4;//（加盟商）受理未通过
	 
	/**
	 * 邀请担保人状态
	 */
	int TENDER_RECOGNIZOR_AGREESTATUS_WAIT = 0;//等待
	int TENDER_RECOGNIZOR_AGREESTATUS_AGREE = 1;//同意
	int TENDER_RECOGNIZOR_AGREESTATUS_NOAGRED = 2;//不同意
	
	/**
	 * 网络认证记录状态
	 */
	byte NETWORKAUTHRECORD_STATUS_SUCCESS = 1;//成功
	byte NETWORKAUTHRECORD_STATUS_ERROR = 2;//异常
	byte NETWORKAUTHRECORD_STATUS_FAILURE = 3;//失败
	byte NETWORKAUTHRECORD_STATUS_ITERANCE = 4;//重复
	byte NETWORKAUTHRECORD_STATUS_WAIT_AUTH = 5;//待认证
	byte NETWORKAUTHRECORD_STATUS_COMPLETE_AUTH = 6;//认证完成
	byte NETWORKAUTHRECORD_STATUS_REAUTH = 7;//待重新认证
	byte NETWORKAUTHRECORD_STATUC_REAUTH_YET = 8;//重新认证完成
	
	/**
	 * 身份证认证机构
	 */
	int IDCARD_AUTHEN_THIRDPARTY_JF = 1;//巨丰
	int IDCARD_AUTHEN_THIRDPARTY_GZT = 2;//国政通
	
	/**
	 * 身份认证返回结果 -- 巨丰认证
	 */
	int IDCARDAUTHEN_RESULT_JF_NO_RECORD = 2;//没有记录 
	int IDCARDAUTHEN_RESULT_JF_NOT_ACCORD = 1;//结果不一致 
	int IDCARDAUTHEN_RESULT_JF_ACCORD = 0;//结果一致 
	
	/**
	 * 身份认证返回结果 -- 国政通认证
	 */
	int IDCARDAUTHEN_RESULT_GZT_NO_RECORD = 1;//没有记录 
	int IDCARDAUTHEN_RESULT_GZT_NOT_ACCORD = 2;//结果不一致 
	int IDCARDAUTHEN_RESULT_GZT_ACCORD = 3;//结果一致 
	
	/**
	 * 学历认证返回结果
	 */
	int DIPLOMAAUTHEN_RESULT_SUCCESS = 0;//成功
	
	/**
	 * 债权转让标的状态
	 */
	byte CREDITASSIGNMENT_STATUS_NORMAL = 1; //进行中
	byte CREDITASSIGNMENT_STATUS_SUCCESS = 2; //成功
	byte CREDITASSIGNMENT_STATUS_FAILURE = 3; //流拍
	byte CREDITASSIGNMENT_STATUS_BACK = 4; //已撤回
	
	/**
	 * 债权拍卖模式
	 */
	byte CREDITASSIGNMENT_MODE_PUBLIC = 1; //明拍
	byte CREDITASSIGNMENT_MODE_SECRETS = 2; //暗拍
	byte CREDITASSIGNMENT_MODE_FIXEDPRICE = 3; //一口价
	
	byte AUCTIONRECORD_STATUS_UNDERWAY = 1; //竞拍中
	byte AUCTIONRECORD_STATUS_SUCCESS = 2; //中标
	byte AUCTIONRECORD_STATUS_FAIL = 3; //未中标
	
	/**
	 * 问题类型(对标或拍卖的提问)
	 */
	byte QUESTIONANSWER_QTYPE_TENDER = 1;  //1：对标的提问
	byte QUESTIONANSWER_QTYPE_CREDITASSIGNMENT = 2;  //2：对债权拍卖的提问
	
	/**
	 * 提问或回答(对标或拍卖)
	 */
	byte QUESTIONANSWER_TYPE_QUESTION = 1;  //1：提问
	byte QUESTIONANSWER_TYPE_ANSWER = 2;  //2：回答
	
	/**
	 * 问答的状态
	 * */
	byte QUESTIONANSWER_STATUS_SHOW=1;
	byte QUESTIONANSWER_STATUS_HIDDEN=2;
	
	/**
	 * 材料审核状态
	 * 0 未处理
	 * 1 已通过
	 * 2 未通过
	 */
	int MATERIAL_VERIFICATION_STATUS_WAIT = 0;	//未处理
	int MATERIAL_VERIFICATION_STATUS_YES = 1;	//已通过
	int MATERIAL_VERIFICATION_STATUS_NO = 2;	//未通过
	
	/**
	 * 材料类型
	 * 1 本人身份证图片
	 * 2 家属身份证
	 * 3 户口本
	 * 4 结婚证
	 * 5 与直系亲属合影照
	 * 6 驾照
	 * 7 公益贷资料
	 * 8 行驶证
	 * 9 房产证
	 * 10 个人社保
	 * 11 工资卡银行近3个月流水
	 * 12 非工资卡银行近3个月流水
	 * 13 现就职单位劳动合同
	 * 14 营业执照
	 * 15 固定电话近3月详单
	 * 16 支付宝提现流水
	 * 17 央行征信报告
	 * 18 住处相关照片
	 * 19 其它证明
	 * 20担保人资料
	 */
	int MATERIAL_TYPE_MY_IDCARD=1;	    // 本人身份证图片
	int MATERIAL_TYPE_FAMILY_IDCARD=2;	// 家属身份证
	int MATERIAL_TYPE_ACCOUNT=3;	    // 户口本
	int MATERIAL_TYPE_MARRY=4;	        // 结婚证
	int MATERIAL_TYPE_FAMILY_PHOTO=5;	// 与直系亲属合影照
	int MATERIAL_TYPE_DRIVING_LICENSE=6;// 驾照
	int MATERIAL_TYPE_PUBLICCREDIT=7;	// 公益贷资料
	int MATERIAL_TYPE_DRIVE_CARD=8;     //行驶证
	int MATERIAL_TYPE_HOUSE=9;          //房产证
	int MATERIAL_TYPE_SECURITY=10;      //个人社保
	int MATERIAL_TYPE_BANK_CARD=11;     //工资卡银行近3个月流水
	int MATERIAL_TYPE_NO_BANK_CARD=12;  //非工资卡银行近3个月流水
	int MATERIAL_TYPE_LABOR=13;         //现就职单位劳动合同
	int MATERIAL_TYPE_BUSINESS=14;      //营业执照
	int MATERIAL_TYPE_TELEPHONE=15;     //固定电话近3月详单
	int MATERIAL_TYPE_ALIPAY=16;        //支付宝提现流水
	int MATERIAL_TYPE_CREDIT_REPORT=17; //央行征信报告
	int MATERIAL_TYPE_HOUSE_PHOTOS=18;  //住处相关照片
	int MATERIAL_TYPE_OTHERS=19;   		//其它证明
	int MATERIAL_TYPE_RECOGNIZOR=20; 	//担保人资料
	
	/**
	 * 翼星企业标材料类型
	 */
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_LICENSE = 1;// 公司营业执照及分支机构营业执照
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_COM_CODE = 2;// 组织机构代码证
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_TAX_CODE = 3;// 税务登记证
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_LOAN_CARD = 4;// 贷款卡复印件
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_OPENS_CARD = 5;// 基本户开户许可证
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_SPECIAL_SERVICE = 6;// 经营特殊业务许可证
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_ARTICLES = 7;// 最新有效章程
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_LEGAL_PERSON = 8;// 法定代表人
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_TAX_CLEARANCE = 9;// 近两年纳税申报表和完税证明
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_SOCIAL_INSURANCE = 10;// 社会保险登记证
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_SHAREHOLDER = 11;// 全部股东身份证明文件
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_FIXED_ASSETS = 12;// 公司的固定资产列表
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_LARGE_TICKET_ASSET = 13;// 公司主要大额资产的权属证明文件
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_CAPITAL_VERIFI_REPORT = 14;// 历次的验资报告
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_FINANCIAL_REPORTS = 15;// 近三年经审计的财务报告
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_CASH_FLOW = 16;// 近6月的现金流量表
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_SHAR_BANK_STATEMENT = 17;// 近1年股东个人银行账单
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_COM_BANK_STATEMENT = 18;// 近1年公司主要账户的银行对账单
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_HOUSE_PROPRIETARY_CERTIFICATE = 19;// 自有房产产权证书或房屋租赁协议
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_CREDIT_INFOR_REP = 20;// 控股股东征信报告
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_THE_WIND = 21;// 首席风控官简历身份证
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_COMPLIANCE_OFFICER = 22;// 首席合规官简历身份证
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_WIND_CONTROL = 23;// 公司的风控管理办法
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_GUARANTY = 24;// 公司的担保物处置及追偿管理办法
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_MAIN_BUSINESS = 25;// 近3年公司主营业务经营总规模
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_COOPERATION_AGREEMENT = 26;// 公司与大型机构合作的合作协议
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_MARKET_NO = 27;// 公司的市场排名情况证明文件
	int WUT_TENDER_ENTERPRISE_MATERIAL_TYPE_EMP_LIST = 28;// 公司在册业务人员总名单及工资明细 ;	

	
	String AUTH_PAGE = "authPage";
	String INFO_PAGE = "infoPage";
	String SYSTEM_BLACKLIST = "systemBlacklist";
	
	/**
	 * 上传材料图片是否公开
	 */
	int MATERIAL_ISPUBLIC_NULL=0;	//既不是公开，也不是不公开
	int MATERIAL_ISPUBLIC_NO=1;		//不公开
	int MATERIAL_ISPUBLIC_YES=2;	//公开

	
	/**
	 * 验证码类型
	 */
	int VERIFICATIONCODE_TYPE_FINDPWD= 1;//找回密码 
	int VERIFICATIONCODE_TYPE_FINDPAYPWD= 11;//找回支付密码
	int VERIFICATIONCODE_TYPE_CHANGEBANKCARD= 2;//修改银行卡号
	int VERIFICATIONCODE_TYPE_SETBANKCARD= 21;//修改银行卡号
	
	int VERIFICATIONCODE_TYPE_CHANGEPWD=4;//修改密码
	
	int VERIFICATIONCODE_TYPE_CHANGEPAYPWD=3;//修改支付密码
	int VERIFICATIONCODE_TYPE_SETPAYPWD=31;//设置支付密码
	
	int VERIFICATIONCODE_TYPE_CHANGEMOBILE=5;//修改手机号码
	int VERIFICATIONCODE_TYPE_SETGEMOBILE=51;//修改手机号码
	
	public static final int VERIFICATIONCODE_TYPE_REMOVE_ABNORMITY=6;//解除异常锁定验证码
	
	
	/**
	 * 验证码状态
	 */
	int VERIFICATIONCODE_STATUS_UNUSED = 0;//未使用
	int VERIFICATIONCODE_STATUS_USED = 1;//已使用
	int VERIFICATIONCODE_STATUS_OUTDATE = 2;//过期
	
	/**********通知项 对应的 静态变量*********** 开始**/
	/**借入者	:对我的借款提问,对我的借款放款(投标),我的借款流标,我的借款进度达到80%,我的借款满额,我的借款进入审核状态,提醒我上传审核资料,我的借款审核成功,成功还款,待还款逾期,**/
	public static final String NOTICE_JRZ_WDJKCSCGHSB ="NOTICE_JRZ_WDJKCSCGHSB"; //我的借款初审成功或失败
	public static final String NOTICE_JRZ_DWDJKTW = "NOTICE_JRZ_DWDJKTW"; // 对我的借款提问
	public static final String NOTICE_JRZ_DWDJKFK ="NOTICE_JRZ_DWDJKFK"; //对我的借款放款(投标)
	public static final String NOTICE_JRZ_WDJKLB ="NOTICE_JRZ_WDJKLB"; //我的借款流标
	public static final String NOTICE_JRZ_WDWTJKLB ="NOTICE_JRZ_WDWTJKLB"; //我的翼星计划借款流标
	public static final String NOTICE_JRZ_WDWTJKCSLB ="NOTICE_JRZ_WDWTJKCSLB"; //我的翼星计划借款后台管理员初审流标
	public static final String NOTICE_JRZ_WDJKJDDDBFZN ="NOTICE_JRZ_WDJKJDDDBFZN"; //我的借款进度达到80%
	public static final String NOTICE_JRZ_WDJKME ="NOTICE_JRZ_WDJKME"; //我的借款满额
	public static final String NOTICE_JRZ_WDJKJRSHZT ="NOTICE_JRZ_WDJKJRSHZT"; //我的借款进入审核状态
	public static final String NOTICE_JRZ_TXWSCSHZL ="NOTICE_JRZ_TXWSCSHZL"; //提醒我上传审核资料
	public static final String NOTICE_JRZ_WDJKSHCG ="NOTICE_JRZ_WDJKSHCG"; //我的借款审核成功
	public static final String NOTICE_JRZ_CGHK ="NOTICE_JRZ_CGHK"; //成功还款
	public static final String NOTICE_JRZ_DHKYQ ="NOTICE_JRZ_DHKYQ"; //待还款逾期
	public static final String NOTICE_JRZ_DBRTYHJJWWDB ="NOTICE_JRZ_DBRTYHJJWWDB"; //担保人同意或拒绝为我担保
	public static final String NOTICE_JRZ_ZQRZRCG ="NOTICE_JRZ_ZQRZRCG"; //债权人转让成功
	public static final String NOTICE_JRZ_GLYFSCSYJ="NOTICE_JRZ_GLYFSCSYJ"; //管理员发送催收邮件
	public static final String NOTICE_JRZ_SHQYDB="NOTICE_JRZ_SHQYDB";//审核区域担保
	public static final String NOTICE_JRZ_REPAYMENT="NOTICE_JRZ_REPAYMENT";//通知用户有即将到期的借款
	public static final String NOTICE_JRZ_FCTF="NOTICE_JRZ_FCTF";//标初审失败
	public static final String NOTICE_JRZ_REPAYMONEY="NOTICE_JRZ_REPAYMONEY";//借款人提前偿还部分本金
	
	/**贷出者	:我的放款(投标)成功,我的放款(流标)失败,我收到一笔还款,待收款逾期,借入者回复了我的问题,**/
	public static final String NOTICE_DCZ_WDFKTBCG ="NOTICE_DCZ_WDFKTBCG"; //我的放款(投标)成功
	public static final String NOTICE_DCZ_WDFKSHTG ="NOTICE_DCZ_WDFKSHTG"; //我的放款(投标)审核通过
	public static final String NOTICE_DCZ_WDFKLBSB ="NOTICE_DCZ_WDFKLBSB"; //我的放款(流标)失败
	public static final String NOTICE_DCZ_WSDYBHK ="NOTICE_DCZ_WSDYBHK"; //我收到一笔还款
	public static final String NOTICE_DCZ_DSKYQ ="NOTICE_DCZ_DSKYQ"; //待收款逾期
	public static final String NOTICE_DCZ_JRZHFLWDWT ="NOTICE_DCZ_JRZHFLWDWT"; //借入者回复了我的问题
	public static final String USER_NOTICE_TENDER ="USER_NOTICE_TENDER"; //给新注册用户发送投标通知
	
	/**担保人       :有人邀请我成为担保人,我同意(拒绝)作为担保人,借款成功(失败)，担保生效(无效)**/
	public static final String NOTICE_DBR_YRYQWCWDBR ="NOTICE_DBR_YRYQWCWDBR"; //有人邀请我成为担保人
	public static final String NOTICE_DBR_WTYZWDBR ="NOTICE_DBR_WTYZWDBR"; //我同意(拒绝)作为担保人
	public static final String NOTICE_DBR_JKCGSB ="NOTICE_DBR_JKCGSB"; //借款成功(失败)
	public static final String NOTICE_DBR_DBSXWX ="NOTICE_DBR_DBSXWX"; //担保生效(无效)
	public static final String NOTICE_DBR_DBDBCSHKYQ ="NOTICE_DBR_DBDBCSHKYQ"; //担保的标产生还款逾期
	
	/**债权转让人   :债权竞拍成功(失败),债权提问,有人竞拍,**/
	public static final String NOTICE_ZQZRR_JQJPCG ="NOTICE_ZQZRR_JQJPCG"; //债权竞拍成功(失败)
	public static final String NOTICE_ZQZRR_JQTW ="NOTICE_ZQZRR_JQTW"; //债权提问
	public static final String NOTICE_ZQZRR_YRJP ="NOTICE_ZQZRR_YRJP"; //有人竞拍
	public static final String NOTICE_CREDITASSIGNMENT_DISMANTLE_FQZ = "NOTICE_CREDITASSIGNMENT_DISMANTLE_FQZ"; //债权转让撤消-发起者
	
	/**债权竞拍人	:竞拍成功(失败),债权转让人回复我提出的问题,**/
	public static final String NOTICE_ZQJPR_JPCG ="NOTICE_ZQJPR_JPCG"; //竞拍成功(失败)
	public static final String NOTICE_ZQJPR_JQZRRHFWDCDWT ="NOTICE_ZQJPR_JQZRRHFWDCDWT"; //债权转让人回复我提出的问题
	public static final String NOTICE_CREDITASSIGNMENT_DISMANTLE_JPZ = "NOTICE_CREDITASSIGNMENT_DISMANTLE_JPZ"; //债权转让撤消-竞拍者
	
	/**公共:	好友发布借款,好友还款逾期,好友发布债权转让,被加为好友,被好友删除,认证成功(失败)**/
	public static final String NOTICE_GG_HYFBJK ="NOTICE_GG_HYFBJK"; //好友发布借款
	public static final String NOTICE_GG_HYHKYQ ="NOTICE_GG_HYHKYQ"; //好友还款逾期
	public static final String NOTICE_GG_HYFBZQZR ="NOTICE_GG_HYFBZQZR"; //好友发布债权转让
	public static final String NOTICE_GG_BJWHY ="NOTICE_GG_BJWHY"; //被加为好友
	public static final String NOTICE_GG_RZCGSB ="NOTICE_GG_RZCGSB"; //认证成功(失败)
	public static final String NOTICE_GG_GROUP_SMS ="NOTICE_GG_GROUP_SMS"; //短信群发
	
	public static final String NOTICE_ZQZRR_OVERDUE30D_AUTO = "NOTICE_CREDITASSIGNMENT_OVERDUE30D_AUTO";  //逾期超过30系统自动发布转让通知
	
	/**
	 * 申请创建申请创建或修改群组
	 */
	public static final String NOTICE_GG_SQCJHXGQZ ="NOTICE_GG_SQCJHXGQZ"; //申请创建申请创建或修改群组
	/**
	 * 申请创建和修改群组组成功或失败
	 */
	public static final String NOTICE_GG_SQCJHXGQZCGHSB ="NOTICE_GG_SQCJHXGQZCGHSB"; //申请创建和修改群组组成功或失败
	/**
	 * 用户申请加入群组
	 */
	public static final String NOTICE_GG_YHSQJRQZ ="NOTICE_GG_YHSQJRQZ"; //用户申请加入群组
	/**
	 * 申请加入群组成功或失败
	 */
	public static final String NOTICE_GG_SQJRQZCGHSB ="NOTICE_GG_SQJRQZCGHSB"; //申请加入群组成功或失败
	/**
	 * 好友邀请加入群组
	 */
	public static final String NOTICE_GG_HYYQJRQZ ="NOTICE_GG_HYYQJRQZ"; //好友邀请加入群组

	/**
	 * 请求添加好友
	 */
	public static final String NOTICE_ADDFRIEND = "NOTICE_ADDFRIEND";  //请求添加好友
	/**
	 * 被好友删除
	 */
	public static final String NOTICE_GG_BJHYSC="NOTICE_GG_BJHYSC";//被好友删除
	/**
	 * 添加好友被拒绝
	 */
	public static final String NOTICE_ADDFRIEND_REFUSED = "NOTICE_ADDFRIEND_REFUSED";  //添加好友被拒绝
	
	/**增额申请**/
	public static final String NOTICE_INCREASEQUOTA = "NOTICE_INCREASEQUOTA";//增额申请通过/未通过
	
	/**公益贷**/
	public static final String NOTICE_PUBLICCREDIT_RESULT = "NOTICE_PUBLICCREDIT_RESULT";//公益贷申请结果（通过/未通过）
	
	/**提现**/
	public static final String NOTICE_WITHDRAW_RESULT = "NOTICE_WITHDRAW_RESULT";//提现申请结果（成功/失败）
	
	/**充值**/
	public static final String NOTICE_RECHARGE_RESULT = "NOTICE_RECHARGE_RESULT";//线下充值申请结果（成功/失败）
	
	/**线上充值**/
	public static final String NOTICE_ON_RECHARGE_RESULT = "NOTICE_ON_RECHARGE_RESULT";//线上充值申请结果（成功/失败）
	
	/**还款充值**/
	public static final String NOTICE_ON_RECHARGE_SMS_REPAY_MONEY_RESULT = "NOTICE_ON_RECHARGE_SMS_REPAY_MONEY_RESULT";//还款充值(成功/失败)
	
	/**审核上传材料**/
	public static final String NOTICE_MATERIAL_FAIL = "NOTICE_MATERIAL_FAIL";//上传材料审核（未通过）
	
	/**举报受理**/
	public static final String NOTICE_NEWSREVIEW_REPORT_REPORTOR = "NOTICE_NEWSREVIEW_REPORT_REPORTOR";//通知举报人
	
	/**举报受理**/
	public static final String NOTICE_NEWSREVIEW_REPORT_REVIEWER = "NOTICE_NEWSREVIEW_REPORT_REVIEWER";//通知评论者
	
	/**评论审核**/
	public static final String NOTICE_NEWSREVIES_CHECK = "NOTICE_NEWSREVIEW_REPORT_REVIEWER";//评论审核
	
	/**审核标意见**/
	public static final String NOTICE_TENDER_REVIEW_IDEA_RECORD = "NOTICE_TENDER_REVIEW_IDEA_RECORD";//审核标意见
	
	/**用户确认借款电子借条**/
	public static final String NOTICE_TENDER_USER_ENSURE_ELECTRON = "NOTICE_TENDER_USER_ENSURE_ELECTRON";//用户确认借款电子借条
	
	/**后台管理员修改标 用户确认**/
	public static final String NOTICE_TENDER_USER_ENSURE_EDIT = "NOTICE_TENDER_USER_ENSURE_EDIT";//后台管理员修改标 用户确认 
	
	/**用户重新录制标确认视频**/
	public static final String NOTIC_TENDER_USER_RERECORD_VIDEO = "NOTICE_TENDER_USER_RERECORD_VIDEO";//用户重新录制标确认视频
	
	/**通知用户还款，并开通手机快捷还款业务**/
	public static final String NOTICE_REPAY_MOBILE_SMS = "NOTICE_REPAY_MOBILE_SMS";//通知用户还款，并开通手机快捷还款业务
	
	/**通知用户开通手机快捷还款业务**/
	public static final String NOTICE_SIGN_MOBILE_SMS = "NOTICE_SIGN_MOBILE_SMS";//通知用户开通手机还款业务
	
	/**定时任务自动还款**/
	public static final String NOTICE_TIMER_REPAY_MONEY_EXCEPTION = "NOTICE_TIMER_REPAY_MONEY_EXCEPTION";//定时任务还款异常
	
	/**定时任务自动还款监测**/
	public static final String NOTICE_TIMER_CHECK_REPAY_MONEY_EXCEPTION = "NOTICE_TIMER_CHECK_REPAY_MONEY_EXCEPTION";//定时任务还款异常
	
	/**翼星计划债权推荐人	**/
	public static final String NOTICE_WUT_HANDLER_FXBZJBZ ="NOTICE_WUT_HANDLER_FXBZJBZ"; //翼星计划债权推荐人风险保证金不足通知
	public static final String NOTICE_WUT_HANDLER_YEBZ ="NOTICE_WUT_HANDLER_YEBZ"; //翼星计划债权推荐人余额不足无法完成提现通知
	
	/**翼星计划投资者	**/
	public static final String NOTICE_WUT_DCZ_QZLB ="NOTICE_WUT_DCZ_QZLB"; //翼星计划流包通知(普通投资者)
	public static final String NOTICE_WUT_HANDLER_QZLB ="NOTICE_WUT_HANDLER_QZLB"; //翼星计划流包通知(债权推荐人)
	public static final String NOTICE_WUT_DCZ_PPCG ="NOTICE_WUT_DCZ_PPCG"; //翼星计划匹配成功通知(普通投资者)
	
	/**翼星计划借入者	**/
	public static final String NOTICE_WUT_JRZ_PPCG ="NOTICE_WUT_JRZ_PPCG"; //翼星计划匹配成功通知(翼星计划标借入者)
	public static final String NOTICE_WUT_JRZ_JLRCSTG ="NOTICE_WUT_JRZ_JLRCSTG"; //翼星计划标债权推荐人初审通过通知(翼星计划标借入者)
	public static final String NOTICE_WUT_JRZ_ZBCSTG ="NOTICE_WUT_JRZ_ZBCSTG"; //翼星计划标总部初审通过通知(翼星计划标借入者)
	
	public static final String NOTICE_WUT_JRZ_JLRCSWTG ="NOTICE_WUT_JRZ_JLRCSWTG"; //翼星计划标债权推荐人初审未通过通知(翼星计划标借入者)
	public static final String NOTICE_WUT_JRZ_ZBCSWTG ="NOTICE_WUT_JRZ_ZBCSWTG"; //翼星计划标总部初审未通过通知(翼星计划标借入者)
	public static final String NOTICE_WUT_HANDLER_ZBCSWTG ="NOTICE_WUT_HANDLER_ZBCSWTG"; //翼星计划标总部初审未通过通知(债权推荐人)
	public static final String NOTICE_WUT_JRZ_WDJKSHCG = "NOTICE_WUT_JRZ_WDJKSHCG";// 翼星计划放款通知(翼星计划标借入者)
	public static final String NOTICE_WUT_DCZ_WDFKSHTG ="NOTICE_WUT_DCZ_WDFKSHTG"; //翼星计划我的放款(投标)审核通过
	public static final String NOTICE_WUT_JRZ_WDJKKTX = "NOTICE_WUT_JRZ_WDJKKTX";// 翼星计划放款可提现通知(翼星计划标借入者)
	
	/**翼星计划用户确认借款电子借条**/
	public static final String NOTICE_WUT_TENDER_USER_ENSURE_ELECTRON = "NOTICE_WUT_TENDER_USER_ENSURE_ELECTRON";//翼星计划用户确认借款电子借条
	
	/**翼星计划标初审失败**/
	public static final String NOTICE_WUT_JRZ_FCTF="NOTICE_WUT_JRZ_FCTF";//标初审失败
	
	/***翼星计划后台管理员修改标 用户确认**/
	public static final String NOTICE_WUT_TENDER_USER_ENSURE_EDIT = "NOTICE_WUT_TENDER_USER_ENSURE_EDIT";//翼星计划后台管理员修改标 用户确认
	
	/***翼星计划产品购买成功**/
	public static final String NOTICE_WUT_BUY_RECORD_SUCCESS = "NOTICE_WUT_BUY_RECORD_SUCCESS";//翼星计划产品购买成功 
	
	/**********通知项 对应的 静态变量*********** 结束**/
	
	/**
	 * 催收方式
	 */
	byte DUN_TYPE_MOBILEMESSAGE=1;	//手机短信
	byte DUN_TYPE_PRESENT=2;	//当面
	byte DUN_TYPE_PHONE=3;	//电话催收
	byte DUN_TYPE_OTHER=4;//其他
	
	/**
	 * 还款方式
	 */
	int PAYTYPE_NORMAL = 1;   //正常情况下按期还款
	int PAYTYPE_OVERDUE = 2;  //逾期情况下系统自动扣款
	int PAYTYPE_EARLY = 3;    //提前还款
	int PAYTYPE_OVERDUE_DF = 4; //逾期垫付
	int PAYTYPE_PORTION_MONEY=5;//未情况下偿还部分本金
	int PAYTYPE_OVERDUE_PORTION_MONEY=6;//逾期情况下偿还部分本金
	

	/**
	 * 标的结束方式 
	 */
	int TENDER_ENDWAY_NORMAL = 0; //正常结标
	int TENDER_ENDWAY_APPLY = 1;  //申请结标 80%可提前结标

	public static final String RED5_VIDEO_RECORD_PATH = "/video/record";
	public static final String RED5_VIDEO_PLAY_BACK_PATH = "/video/record";
	
	/**
	 * RED5 最大连接数
	 */
	public static int RED5_MAX_CONNECTION = 10;
	
	public static int RED5_MAX_SURVIVE_TIME = 8 * 60 * 1000;
	
	public static int RED5_TIMER_EXCUTE_TIME = 5 * 1000;
	
	/**
	 * 网络认证属实与否
	 */
	int NETWORK_AUTH_RECORD_VERIFIED = 1;//属实
	int NETWORK_AUTH_RECORD_COUNTERFEIT = 0;//造假
	
	/**
	 * 投标方式
	 */
	byte TENDERRECORD_TENDERTYPE_HAND = 1;//手动投标
	byte TENDERRECORD_TENDERTYPE_AUTO = 2;//自动投标
	
	/**
	 * 信用额度记录操作
	 */
	int USERLIMITRECORD_OPRATE_TYPE_REDUCE = 1;//减操作
	int USERLIMITRECORD_OPRATE_TYPE_PLUS = 2;//加操作
	
	/**
	 * 标的进度
	 */
	double TENDER_PROGRESS_EIGHTY_PERCENT = 0.8;//标的进度80%
	
	/**
	 * 加盟商结算状态
	 */
	byte SETTLEMENT_RECORD_STATUS_WAIT = 0;//未结算
	byte SETTLEMENT_RECORD_STATUS_ALREADYBALANCE = 1;//已结算
	String SETTLEMENT_RECORD_HEAD = "SETTLEMENT_RECORD_HEAD";//总部
	String SETTLEMENT_RECORD_AREA = "SETTLEMENT_RECORD_AREA";//加盟商
	
	/**
	 * 在线充值第三方：国付宝
	 */
	int ONLINERECHARGE_THIRDPARTY_GOPAY = 1;
	/**
	 * 在线充值第三方：联动优势
	 */
	int ONLINERECHARGE_THIRDPARTY_UMP = 2;
	/**
	 * 联动手机支付 -- 催缴
	 */
	int ONLINERECHARGE_THIRDPARTY_UMP_MOBILE = 3;
	/**
	 * 联动手机支付 -- 直扣（用户还款）
	 */
	int ONLINERECHARGE_THIRDPARTY_UMP_MOBILE_SYN = 4;
	
	public static final byte ONLINERECHARGE_THIRDPARTY_LLPAY=5;
	
	public static final byte ONLINERECHARGE_THIRDPARTY_YEEPAY=7;
	
	/**
	 * 在线充值状态：待充值
	 */
	byte ONLINERECHARGE_STATUS_WAITING = 2;
	
	/**
	 * 在线充值状态：已充值
	 */
	byte ONLINERECHARGE_STATUS_OVER = 1;
	
	/**
	 * 在线充值(商户信息)属性：商户URL
	 */
	String ONLINERECHARGE_GOPAY_PROPERTITY_GOPAY_URL_KEY = "GopayURL";
	
	/**
	 * 在线充值(商户信息)属性：商户ID
	 */
	String ONLINERECHARGE_GOPAY_PROPERTITY_MERCHANTID_KEY = "MerchantID";
	
	/**
	 * 在线充值(商户信息)属性：商户的账号
	 */
	String ONLINERECHARGE_GOPAY_PROPERTITY_CUSTOMEREMAIL_KEY = "CustomerEMail";
	
	/**
	 * 在线充值(商户信息)属性：商户的国付宝ID
	 */
	String ONLINERECHARGE_GOPAY_PROPERTITY_VIRCARDNOIN_KEY = "VirCardNoIn";
	
	/**
	 * 在线充值(商户信息)属性：商户验证码
	 */
	String ONLINERECHARGE_GOPAY_PROPERTITY_VERFICATIONCODE_KEY = "VerficationCode";
	
	/**
	 * 在线充值(商户信息)属性：交易代码:支付
	 */
	String ONLINERECHARGE_GOPAY_PROPERTITY_TRANCODE_PAY_KEY = "TranCode_Pay";
	
	/**
	 * 在线充值(商户信息)属性：交易代码:单笔查询
	 */
	String ONLINERECHARGE_GOPAY_PROPERTITY_TRANCODE_SINGLEQUERY_KEY = "TranCode_SingleQuery";
	
	/**
	 * 在线充值(商户信息)属性：网站接收地址
	 */
	String ONLINERECHARGE_GOPAY_PROPERTITY_MERURL = "MerURL";
	
	/**
	 * 在线充值(商户信息)属性：本地IP
	 */
	String ONLINERECHARGE_GOPAY_PROPERTITY_LOCAL_IP = "Local_IP";
	
	/**
	 * 在线充值流水号前缀
	 */
	String ONLINERECHARGE_SERIALNUMBER_PREFIX = "EL";
	
	/**
	 * 在线充值转向方式：转向国付宝
	 */
	int ONLINERECHARGE_DIRECT_GOPAY = 1;
	
	/**
	 * 在线充值转向方式：转向银行
	 */
	int ONLINERECHARGE_DIRECT_BANK = 2;
	
	//在线充值用户类型：
	int ONLINERECHARGE_GOPAY_USERTYPE_GOPAY = 0;
	
	/**
	 * 在线充值用户类型：个人网上银行
	 */
	int ONLINERECHARGE_GOPAY_USERTYPE_PERSONAL = 1;
	
	/**
	 *  在线充值用户类型：企业网上银行
	 */
	int ONLINERECHARGE_GOPAY_USERTYPE_ENTERPRISES = 2;
	
	/**
	 *  在线充值结果码：交易成功
	 */
	String ONLINERECHARGE_RESPCODE_SUCCESS = "0000";
	
	/**
	 * 订单失败（银行交易状态失败）
	 */
	String ONLINERECHARGE_RESPCODE_FAIL_BANKSTATUS_FAIL = "4444";

	/**
	 * 订单 处理中（支付平台处理中）
	 */
	String ONLINERECHARGE_RESPCODE_PENDING_IPAY = "5555";
	
	/**
	 * 订单失败（企业复核不通过）
	 */
	String ONLINERECHARGE_RESPCODE_FAIL_ENTERPRISEREVIEW_NOTHROUGH = "6666";

	/**
	 * 订单处理中（企业财务未复核）
	 */
	String ONLINERECHARGE_RESPCODE_PENDING_BUSINESSFINANCE_NOCHECK = "7777";
	
	/**
	 * 订单处理中（银行交易状态未知）
	 */
	String ONLINERECHARGE_RESPCODE_PENDING_BANKSTATUS_UNKNOWN = "8888";
	
	/**
	 * 订单处理中
	 */
	String ONLINERECHARGE_RESPCODE_PENDING = "9999";
	
	/**
	 * 订单失败
	 */
	String ONLINERECHARGE_RESPCODE_FAIL = "其他";
	/**
	 * 退款申请成功
	 */
	String GOPAY_REFUND_APPLY_SUCCESS = "1000";
	
	/**
	 * 线上充值国付宝网关版本号
	 */
	String ONLINERECHARGE_GOPAY_VERSION_2 = "Gopay_Version_2";
	
	/**
	 *  在线充值:转账收费基数(1元起收转账费)
	 */
	int ONLINERECHARGE_MIN_MOENY_TO_FEE = 1;
	
	/**
	 * 贷款保证金比例-6个月以下（含6个月）
	 */
	String LOAN_INSURE_AMOUNT_RATIO_SIX_DOWN = "LOAN_INSURE_AMOUNT_RATIO_SIX_DOWN";
	/**
	 * 贷款保证金比例-6个月以上（不含6个月）
	 */
	String LOAN_INSURE_AMOUNT_RATIO_SIX_UP = "LOAN_INSURE_AMOUNT_RATIO_SIX_UP";
	/**
	 * 贷出者手续费 -- 收取利息比例 
	 */
	String SERVICE_CHARGE_LENDER_RATIO = "SERVICE_CHARGE_LENDER_RATIO";
	/**
	 * 贷出者税费 -- 收取利息比例
	 */
	String TAX_CHARGE_LENDER_RATIO = "TAX_CHARGE_LENDER_RATIO";
	/**
	 * 收取贷出者服务费日期
	 */
	String SERVICE_CHARGE_LENDER_DATE = "SERVICE_CHARGE_LENDER_DATE";
	
	/**
	 * 后台审核标意见最终发送手机号码
	 */
	String TENDER_REVIEW_IDEA_RECORD_MOBILES = "TENDER_REVIEW_IDEA_RECORD_MOBILES";
	
	int LOAN_INSURE_MONEY_TYPE_AGREE = 1;//同意支付贷款保证金
	int LOAN_INSURE_MONEY_TYPE_DISAGREE = 0;//不同意支付贷款保证金
	
	int LOAN_INSURE_AMOUNT_STATUS_UNUSED = 0;//贷款保证金状态：未生效的
	int LOAN_INSURE_AMOUNT_STATUS_USED = 1;//贷款保证金状态：已生效的
	int LOAN_INSURE_AMOUNT_STATUS_INVALID = 2;//贷款保证金状态：设置为无效
	
	public static final String MOBILE_INVITE_RECOGNIZOR="MOBILE_INVITE_RECOGNIZOR"; //短信邀请好友担保人
	
	int ONLINE_RECHARGE_CHECKRETURN_STATUS_FAIL = 1;//线上充值异常查询返回状态(异常)

	//群组权限
	/**
	 * 群组浏览权限 -- 公开
	 */
	byte GROUPS_POWER_PUBLIC = 1;
	/**
	 * 群组浏览权限 -- 封闭
	 */
	byte GROUPS_POWER_CLOSE = 2;
	/**
	 * 群组浏览权限 -- 私密
	 */
	byte GROUPS_POWER_PRIVATE = 3;
	
	
	 // 群组类型
	/**
	 * 借入群组 1
	 */
	byte GROUPS_TYPE_BORROW = 1;
	/**
	 * 贷出群组 2
	 */
	byte GROUPS_TYPE_LOAN = 2;
	/**
	 * 系统群组 3
	 */
	byte GROUPS_TYPE_SYSTEM = 3;
	/**
	 * 其他 4
	 */
	byte GROUPS_TYPE_OTHER = 4;
	
	/**
	 * 重要信息记录 类型 -- 增加
	 */
	int IMPORTANTRECORD_ACTIONTYPE_ADD = 1;
	
	/**
	 * 重要信息记录类型 -- 修改
	 */
	int IMPORTANTRECORD_ACTIONTYPE_UPDATE = 2;
	
	/**
	 * 重要信息记录类型 -- 删除
	 */
	int IMPORTANTRECORD_ACTIONTYPE_DEL = 3;
	
	
	/**
	 * 代理商收入类型
	 */
	public static final int AGENTINCOMES_TYPE_TENDER_FEE = 1;//借款标借入成交服务费
	public static final int AGENTINCOMES_TYPE_DUNNING_FEE = 2;//逾期催收费
	public static final int AGENTINCOMES_TYPE_ASSIGNMENT_FEE = 3;//债权转让成交服务费
	public static final int AGENTINCOMES_TYPE_COLLATERAL_FEE = 4;//担保费
	public static final int AGENTINCOMES_TYPE_VISIT_FEE = 5;//家访费
	public static final int AGENTINCOMES_TYPE_FINANCING_FEE = 6;//放款人财富管理费
	public static final int AGENTINCOMES_TYPE_TENDER_LENDER_FEE = 7;//借款标贷出成交服务费
	public static final int AGENTINCOMES_TYPE_CES_DIVIDE = 8;//体验店分成
	public static final int AGENTINCOMES_TYPE_CJD_GRANT = 9;//体验店分成
	
	/**
	 * 标隐藏状态
	 */
	int TENDER_HIDDEN_STATUS_HIDDEN = 0;//隐藏
	int TENDER_HIDDEN_STATUS_NOMAL = 1;//正常
	
	int USERDEFAULT_TENDER_STATUS = 1234567;//用于查询 - 用户默认页最近发布的借款  - 标状态（非未发布的标）
	
	/**
	 * 加盟商担保 状态 
	 */
	byte AREA_GUARANTEE_STATUS_WFB = 1;//未发布
	byte AREA_GUARANTEE_STATUS_WAIT = 2;//等待审核
	byte AREA_GUARANTEE_STATUS_ONE_NO_TOW_WAIT = 3;//一级审核不通过等待二级审核
	byte AREA_GUARANTEE_STATUS_TOW_NO_ONE_WAIT = 4;//二级审核不通过等待一级审核
	byte AREA_GUARANTEE_STATUS_ALL_NO = 5;//竞标模式时间到或者提交审核，满标模式时间到或者满标，或者一二级审核都不通过
	byte AREA_GUARANTEE_STATUS_TOW_NO_ONE_ACCEPT = 6;//二级审核不通过一级同意
	byte AREA_GUARANTEE_STATUS_ONE_NO_TOW_ACCEPT = 7;//一级审核不通过二级同意
	byte AREA_GUARANTEE_STATUS_ONE_ACCEPT = 8;//一级审核通过
	byte AREA_GUARANTEE_STATUS_TOW_ACCEPT = 9;//二级审核通过
	
	/**
	 * 加盟商担保标的状态类型
	 * */
	byte AREA_GUARANTEE_STATUS_TYPE_WAIT=1;//等待审核的 
	byte AREA_GUARANTEE_STATUS_TYPE_ACCEPT=2;//审核通过
	byte AREA_GUARANTEE_STATUS_TYPE_NO=3;//审核不通过
	
	
	/**
	 * 加盟商担保 类型 
	 */
	int AREA_GUARANTEE_TYPE_NO=0;//无加盟商担保
	int AREA_GUARANTEE_TYPE_BZDJMS=1;//不指定加盟商
	int AREA_GUARANTEE_TYPE_ZDJMS=2;//指定加盟商
	
	/**
	 * 加盟商级别
	 */
	int AGENT_LEVEL_ONE = 1;//一级加盟商
	int AGENT_LEVEL_TWO = 2;//二级加盟商
	int AGENT_LEVEL_OTHER = 0;//其他
	
	/**
	 * 发标时，选择的担保项
	 */
	int VOUCH_TYPE_NO = 0;//没有担保
	int VOUCH_TYPE_AREA = 1;//区域担保
	int VOUCH_TYPE_PERSON = 2;//个人担保
	
	/**
	 * 方法返回int类型值
	 */
	int RETURN_RESULT_TYPE_0 = 0;
	int RETURN_RESULT_TYPE_1 = 1;
	int RETURN_RESULT_TYPE_MONEY_NOTENOUGH = 3;//用户余额不足
	
	/**
	 * IP控制状态
	 */
	int IP_ACCESS_POLICY_STATUS_REJECT = 0;//拒绝访问
	int IP_ACCESS_POLICY_STATUS_AGREE = 1;//允许访问
	
	/**
	 * 客服信息的 状态
	 */
	public static final byte CUSTOMER_SERVICE_PERSON_STATUS_USABLE = 1;
	public static final byte CUSTOMER_SERVICE_PERSON_STATUS_UNUSABLE = 2;
	
	/**
	 * 新闻状态
	 */
	int NEWS_STATUS_HIDDEN = 0;//隐藏
	int NEWS_STATUS_NORMAL = 1;//正常
	
	/***
	 *资讯评论记录的状态   0为隐藏，1为正常
	 */
	int NEWS_REVIEWS_STATUS_HIDDEN = 0;//隐藏
	int NEWS_REVIEWS_STATUS_ORDINARY = 1;//正常
	
	/**
	 * 资讯评论的举报记录状态	0为未受理，1受理通过，2受理不通过
	 * */
	int NEWS_REVIEWS_REPORT_STATUS_WRITE = 0;//未受理
	int NEWS_REVIEWS_REPORT_STATUS_PASS = 1;//受理通过
	int NEWS_REVIEWS_REPORT_STATUS_NOPASS = 2;//受理不通过
	
	/**
	 * 后台管理员操作类型
	 */
	int MANAGER_OPERATE_TYPE_0 = 0;
	int MANAGER_OPERATE_TYPE_1 = 1;
	/**
	 * 隐藏身份证号码位数
	 */
	public static final int IDCARD_HIDE_NUMBER = 8;

	/**
	 * 群组话题状态
	 */
	public static final int GROUP_SUBJECT_NORMAL = 1;//正常
	public static final int GROUP_SUBJECT_FORBIDDEN = 2;//禁用
	public static final int GROUP_SUBJECT_GOOD_ARTICLE = 3;//精华文章
	/**
	 * 公益标的标准 实际利率小于1%
	 */
	double TENDER_TYPE_PUBLICCREDIT_INTERESTRATE = 0.01;
	//群组状态 1 正常 2 申请中 3 申请失败 4 禁用
	/**
	 * 群组状态 1 正常 
	 */
	public static final int GROUP_STATUS_NORMAL = 1;
	/**
	 * 群组状态  2 申请中
	 */
	public static final int GROUP_STATUS_APPLY = 2;
	/**
	 * 群组状态  3 申请失败
	 */
	public static final int GROUP_STATUS_APPLY_FAIL = 3;
	/**
	 * 群组状态4 禁用
	 */
	public static final int GROUP_STATUS_FORBIDDEN = 4;
	//申请加入群组 状态值 1 正常 2 申请中 3 申请失败
	/**
	 * 申请加入群组 成功
	 */
	public static final int USER_GROUP_STATUS_NORMAL = 1;
	/**
	 * 申请加入群组 申请中
	 */
	public static final int USER_GROUP_STATUS_APPLY = 2;
	/**
	 * 申请加入群组  申请失败
	 */
	public static final int USER_GROUP_STATUS_APPLY_FAIL = 3;
	/**
	 * 用户 与 群组 没有关系
	 */
	public static final int USER_GROUP_STATUS_NO_RELATION = -1;
	
	/**
	 * ajax请求HTML的时间
	 * */
	public static int AJAX_TIMEOUT_SELECT_HTML_TIME=20000;
	/**
	 * ajax请求JSON的时间
	 * */
	public static int AJAX_TIMEOUT_SELECT_JSON_TIME=20000;
	/**
	 * 	ajax上传文件的时间
	 * */
	public static int AJAX_TIMEOUT_UPLOAD_FILE_TIME=20000;
	/**
	 * ajax修改数据库的时间
	 * */
	public static int AJAX_TIMEOUT_UPDATA_DATA_TIME=20000;
	/**
	 * 在JSP中申明Ajax请求时间变量的字符串
	 * */
	public static String AJAX_TIMEOUT_DECLARE="<script type=\"text/javascript\">"+
												"var selectHtmlTime="+AJAX_TIMEOUT_SELECT_HTML_TIME+";"+
												"var selectJsonTime="+AJAX_TIMEOUT_SELECT_JSON_TIME+";"+
												"var uploadFileTime="+AJAX_TIMEOUT_UPLOAD_FILE_TIME+";"+
												"var updataDataTime="+AJAX_TIMEOUT_UPDATA_DATA_TIME+";"+
												"function ajaxError () {alert(\"网络错误！请稍候再试\");}"+
												"</script>";
	/**
	 * 客服发展用户记录 的map存在servletcontext中 的索引
	 */
	public static final String USER_DEVELOP_RECORD_COUNT_FOR_USER = "userDevelopRecordCountForUser";
	/**
	 * 客服发展用户记录 status 状态  1 正常
	 */
	public static final int USER_DEVELOP_RECORD_STATUS_NORMAL = 1;
	/**
	 * 客服发展用户记录 status 状态  2 隐藏
	 */
	public static final int USER_DEVELOP_RECORD_STATUS_HIDDEN = 2;
	
	/**
	 * 用户申请的加盟信息状态：前台查找时往后台传来的参数，表示不通过状态进行过滤
	 * */
	public static final int CANVASS_BUSINESS_STATUS_ALL=0;
	/**
	 * 用户申请的加盟信息状态：等待审核
	 * */
	public static final int CANVASS_BUSINESS_STATUS_WAIT=1;
	/**
	 * 用户申请的加盟信息状态：审核通过
	 * */
	public static final int CANVASS_BUSINESS_STATUS_PASS=2;
	/**
	 * 用户申请的加盟信息状态：审核不通过
	 * */
	public static final int CANVASS_BUSINESS_STATUS_NO=3;
	
	/**
	 * 方法返回成功
	 * */
	public static final int FUNCTION_RETURN_SUCCESS=1;
	/**
	 * 方法返回失败
	 * */
	public static final int FUNCTION_RETURN_ERROR=0;
	
	/**
	 * 判断线上充值
	 */
	public static final int ONLINERECHARGETYPE = 2;
	
	/**
	 * 重新认证视频 （待认证）
	 */
	public static final int REVIDEO_REAUTHEN = 1;
	/**
	 * 重新认证视频 （已认证）
	 */
	public static final int REVIDEO_YETAUTH = 2;
	
	/**
	 * 特殊标资料库——状态
	 */
	public static final int TENDER_SPECIAL_DATABANK_STATUS_UNUSABLE = 0;//不可用
	public static final int TENDER_SPECIAL_DATABANK_STATUS_USABLE = 1;//可用
	
	/**
	 * 特殊标资料库——类型
	 */
	public static final int TENDER_SPECIAL_DATABANK_TYPE_ONUKA = 1;//大额

	/**
	 * 后台审核标意见记录——状态
	 */
	public static final int TENDER_REVIEW_IDEA_RECORD_STATUS_UNUSEFUL = 0;//不可用的
	public static final int TENDER_REVIEW_IDEA_RECORD_STATUS_USEBLE = 1;//可用的
	
	/**
	 * 后台审核标意见记录——类型
	 */
	public static final int TENDER_REVIEW_IDEA_RECORD_TYPE_NOPASS = 0;//不通过
	public static final int TENDER_REVIEW_IDEA_RECORD_TYPE_PASS = 1;//通过
	public static final int TENDER_REVIEW_IDEA_RECORD_TYPE_CONDITIONAL_PASS = 2;//有条件通过
	
	
	public static final int MIN_CHECK_PERSON = 3; //一个标至少要几人提交审核结果才能上报给老板审核
	
	/**
	 * 后台审核标意见人类型
	 */
	public static final int TENDER_REVIEW_IDEA_RECORD_OPERATORTYPE_0 = 0;//总部
	public static final int TENDER_REVIEW_IDEA_RECORD_OPERATORTYPE_1 = 1;//一级加盟商
	public static final int TENDER_REVIEW_IDEA_RECORD_OPERATORTYPE_2 = 2;//县级运营商
	public static final int TENDER_REVIEW_IDEA_RECORD_OPERATORTYPE_3 = 3;//总部可见
	
	/**
	 * 后台审核标意见人角色
	 */
	public static final String TENDER_REVIEW_IDEA_RECORD_OPREATORROLE_00 = "00";//总部总风控
	public static final String TENDER_REVIEW_IDEA_RECORD_OPREATORROLE_01 = "01";//总部法务风控
	public static final String TENDER_REVIEW_IDEA_RECORD_OPREATORROLE_02 = "02";//总部财务风控
	public static final String TENDER_REVIEW_IDEA_RECORD_OPREATORROLE_03 = "03";//总部普通风控
	public static final String TENDER_REVIEW_IDEA_RECORD_OPREATORROLE_10 = "10";//加盟商总风控
	public static final String TENDER_REVIEW_IDEA_RECORD_OPREATORROLE_11 = "11";//加盟商法务风控
	public static final String TENDER_REVIEW_IDEA_RECORD_OPREATORROLE_12 = "12";//加盟商普通风控
	
	/**
	 * 意向放款用户处理的状态:未受理
	 * */
	public static final int INTENTION_LENDING_USER_STATUS_NO = 1;
	/**
	 * 意向放款用户处理的状态:已受理
	 * */
	public static final int INTENTION_LENDING_USER_STATUS_PASS = 2;
	
	/**
	 * 初审标的审核记录状态:加盟商审核通过
	 * */
	public static final byte TENDER_FIRST_TRIAL_STATUS_FRAN_PASS = 1;
	/**
	 * 初审标的审核记录状态:加盟商审核不通过
	 * */
	public static final byte TENDER_FIRST_TRIAL_STATUS_FRAN_NO = 2;
	/**
	 * 初审标记录状态：总部初审通过
	 */
	public static final byte TENDER_FIRST_TRIAL_STATUS_HQ_PASS = 3;
	/**
	 * 初审标记录状态：总部初审不通过
	 */
	public static final byte TENDER_FIRST_TRIAL_STATUS_HQ_NO = 4;
	
	/**
	 * 翼龙贷公用状态：99
	 */
	public static final int DKWEB_COMMON_STATUS_99 = 99;
	
	/**
	 * 用户账户调整记录状态——待复审
	 */
	public static final int USER_BALANCE_ADJUST_RECORD_STATUS_WAIT = 0;
	/**
	 * 用户账户调整记录状态——复审通过
	 */
	public static final int USER_BALANCE_ADJUST_RECORD_STATUS_PASS = 1;
	/**
	 * 用户账户调整记录状态——复审不通过
	 */
	public static final int USER_BALANCE_ADJUST_RECORD_STATUS_REJECT = 2;
	/**
	 * 用户账户调整记录类型-增加
	 */
	public static final int USER_BALANCE_ADJUST_RECORD_TYPE_ADD = 1;
	/**
	 * 用户账户调整记录类型-减少
	 */
	public static final int USER_BALANCE_ADJUST_RECORD_TYPE_REDUCE = 2;
	
	/**
	 * 手机验证记录状态，1未验证
	 * */
	public static final byte MOBILE_VERIFY_RECORD_NO=1;
	/**
	 * 手机验证记录状态，2已经验证
	 * */
	public static final byte MOBILE_VERIFY_RECORD_PASS=2;
	
	/**
	 * 手机验证记录状态，3手机注册并通过验证
	 */
	public static final byte MOBILE_VERIFY_RECORD_REGIEST_PASS=3;
	/**
	 * 图片启用状态,1表示启用
	 */
	public static final byte ADVERT_PICTURES_ENABLED=1;
	/**
	 * 图片启用状态，2表示不启用
	 */
	public static final byte ADVERT_PICTURES_NO=2;
	
	/**
	 * 加盟商月度统计结算状态：
	 */
	public static final byte AGENT_STATISTICS_STATUS_CLEARING = 1; //已结算
	
	/**
	 * 加盟商资金流水表收入支出类型
	 */
	public static final int AGENT_FUNDSINFO_TYPE_CLEARING = 1; //月度利润结算
	public static final int AGENT_FUNDSINFO_TYPE_PAY = 2; //逾期垫付还款
	public static final int AGENT_FUNDSINFO_TYPE_WITHDRAW = 3; //提现
	public static final int AGENT_FUNDSINFO_TYPE_WITHDRAW_REJECT = 4; //提现拒绝放款资金返还
	public static final int AGENT_FUNDSINFO_TYPE_ADJUST = 5; //后台管理员对资金进行调整
	public static final int AGENT_FUNDSINFO_TYPE_CES_INCOME = 6;//体验店分成收益
	
	/**
	 * 设置贷款损失准备金为失效的方法返回类型
	 * */
	public static final byte SET_LOAN_LOANER_INVALID_SUCCESS = 1;//成功
	public static final byte SET_LOAN_LOANER_INVALID_MISSING = 2;//失败：不存在
	public static final byte SET_LOAN_LOANER_INVALID_REPEAT = 3;//已操作过
	public static final byte SET_LOAN_LOANER_INVALID_NO = 4;//操作的记录贷款损失准备金未生效
	public static final byte SET_LOAN_LOANER_INVALID_TENDER_FINISH = 5;//标已经完成所有的还款，不能设置为失效
	
	/**
	 * 运营中心的状态 1：启用
	 * */
	public static final byte AREA_STATUS_ENABLE = 1;
	/**
	 * 运营中心的状态 2：未启用
	 * */
	public static final byte AREA_STATUS_DISENABLE = 2;
	/**
	 * 运营中心管理员状态 1：启用
	 * */
	public static final byte AREA_MANAGER_STATUS_ENABLE = 1;
	/**
	 * 运营中心管理员状态 2：未启用
	 * */
	public static final byte AREA_MANAGER_STATUS_DISENABLE = 2;
	
	/**
	 * 通过手机重置银行卡号
	 * */
	public static final byte RESET_BANK_CARD_TYPE_MOBILE = 1;
	/**
	 * 通过邮箱重置银行卡号
	 * */
	public static final byte RESET_BANK_CARD_TYPE_EMAIL = 2;
	/**
	 * 通过密保问题重置银行卡号
	 * */
	public static final byte RESET_BANK_CARD_TYPE_QUESTION = 3;
	
	/**
	 * 查看每日充值验证最小日期
	 */
	public static final String CHECK_ONLINERECHARGE_MINDATE = "2012-08-01";
	
	/**
	 * 管理员类型
	 */
	public static final int ADMIN_TYPE_HQ = 0;//总部
	public static final int ADMIN_TYPE_FRAN = 1;//加盟商
	
	/**
	 * 会员紧急联系人类型
	 * */
	public static byte USER_CONCAT_PEOPLE_TYPE_KINSFOLK = 1;//亲人
	public static byte USER_CONCAT_PEOPLE_TYPE_FRIEND = 2;//社会朋友
	public static byte USER_CONCAT_PEOPLE_TYPE_WORKMATE = 2;//同学
	
	/**
	 * 后台管理员修改标记录状态
	 */
	public static int ADMIN_EDIT_TENDER_RECORD_STATUS_WAIT = 0;//待确认
	public static int ADMIN_EDIT_TENDER_RECORD_STATUS_ENSURE_YES = 1;//确认通过
	public static int ADMIN_EDIT_TENDER_RECORD_STATUS_ENSURE_NO = 2;//确认不通过
	
	/**
	 * 后台管理员设置自动投标条件
	 */
	public static int ADMIN_AUTO_LEND_SET_STATUS_UNUSABLE = 0;//禁用的
	public static int ADMIN_AUTO_LEND_SET_STATUS_USABLE = 1;//启用的
	
	
	/**
	 * 管理员修改用户信息类型项
	 */
	public static byte MODIFY_USER_NAME=1;//修改用户姓名 
	public static byte MODIFY_USER_MOBILE=2;//修改用户手机号
	public static byte MODIFY_USER_STATUS_LOCK=3;//异常登录锁定用户
	
	public static String ID5FREEDATE = "2015年9月10日";
	
	//用户资料拦截标示符
	public static final String USER_DATA_FILTER_IDENTIFIER = "userData/";
	
	//用户上传资料的加密字符串
	public static final String USER_UPLOAD_FILE_SIGN = "eloancn_sign_4000805055";
	
	//用户头像临时表记录状态：
	public static final int USER_CASUAL_PHOTO_STATUS_NEW = 1;//新建
	public static final int USER_CASUAL_PHOTO_STATUS_COMPLETE = 2;//完成
	
	//推荐活动相关
	public static final String TASK_RECOMMEND_TIME_START = "TASK_RECOMMEND_TIME_START";//推荐活动开始时间
	public static final String TASK_RECOMMEND_TIME_END = "TASK_RECOMMEND_TIME_END";//推荐活动结束时间
	public static final String TASK_RECOMMEND_REWARE="TASK_RECOMMEND_REWARE";//推荐活动奖励被推荐获得利息的2%
	
	//手机验证格式
	public static final String EXPRESSION_MOBILE_FORMAT="EXPRESSION_MOBILE_FORMAT";
	
	/**
	 * 用户资料类型
	 */
	public static final int USER_DATA_TYPE_HEADPHOTO = 1;//用户头像
	public static final int USER_DATA_TYPE_AUDIT_MATERIAL = 2;//审核材料
	public static final int USER_DATA_TYPE_CREDIT_MATERIAL = 3;//信用材料
	public static final int USER_DATA_TYPE_INCREASE_MATERIAL = 4;//增额材料
	public static final int USER_DATA_TYPE_TENDER_MATERIAL = 5;//关于标的材料(大额标)
	public static final int USER_DATA_TYPE_TENDER_ELECTRON_IOU = 6;//电子借条
	public static final int USER_DATA_TYPE_ASSIGN_ELECTRON_IOU = 7;//债权转让电子借条
	public static final int USER_DATA_TYPE_OVERDUE_NOTICE = 8;//逾期告知书
	public static final int USER_DATA_TYPE_VIDEO_CERTIFICATION = 9;//视频认证资料
	public static final int USER_DATA_TYPE_NET_CERTIFICATION = 10;//网络认证资料
	public static final int USER_DATA_TYPE_GROUP_MATERIAL = 11;//群组资料
	public static final int USER_DATA_TYPE_TOPIC_MATERIAL = 12;//圈子话题资料
	public static final int USER_DATA_TYPE_FRANCH_AUDIT_MATERIAL = 13;//加盟商审核材料
	public static final int USER_DATA_TYPE_RECOGNIZOR_MATERIAL = 14;//担保人材料
	public static final int USER_DATA_TYPE_PUBLIC_CREDIT_MATERIAL = 15;//公益贷材料
	public static final int USER_DATA_TYPE_WUT_TENDER_ENTERPRISE_MATERIAL = 16;//翼星企业型贷款材料
	
	/**
	 * 用户资料状态
	 */
	public static final int USER_DATA_STATUS_WAIT_CHECK = 0;//未审核
	public static final int USER_DATA_STATUS_CHECK_PASS = 1;//审核通过(总部)
	public static final int USER_DATA_STATUS_CHECK_NO = 2;//审核不通过(总部)
	public static final int USER_DATA_STATUS_FRANCHISEE_PASS = 3;//审核通过(加盟商)
	public static final int USER_DATA_STATUS_FRANCHISEE_NO = 4;//审核不通过(加盟商)
	public static final int USER_DATA_STATUS_USABLE = 5;//可用的
	public static final int USER_DATA_STATUS_UNUSABLE = 6;//不可用的
	public static final int USER_DATA_STATUS_USERDEL = 7;//用户已删除
	
	/**
	 * 用户资料是否公开
	 */
	public static final int USER_DATA_ISPUB_YES = 0;//公开的
	public static final int USER_DATA_ISPUB_NO = 1;//不公开的

	/**
	 * 缓存名字
	 */
	public static final String CACHENAME_FOR_LOGINSESSIONCACHE = "loginSessionCache";//登录用户session缓存
	public static final String CACHENAME_FOR_ADMINLOGINSESSIONCACHE = "adminLoginSessionCache";//登陆管理员session缓存
	public static final String CACHENAME_FOR_ADMINLOGINSESSIONCACHE_SUSER = "suserLoginSessionCache";//后台管理员app登录
	public static final String CACHENAME_FOR_USERDOWNLOAD_PUBDATAS_1 = "userDownLoadPubDatasCache1";//加载用户公共资料缓存
	public static final String CACHENAME_FOR_USERDOWNLOAD_PUBDATAS_2 = "userDownLoadPubDatasCache2";//加载用户公共资料缓存
	public static final String CACHENAME_FOR_USERDOWNLOAD_OWNERDATAS_1 = "userDownLoadOwnerDatasCache1";//加载用户自己的资料缓存
	public static final String CACHENAME_FOR_USERDOWNLOAD_OWNERDATAS_2 = "userDownLoadOwnerDatasCache2";//加载用户自己的资料缓存
	
	
	public static final String CACHENAME_FOR_USER_DATA = "checkUserDataCache";
	public static final String CACHENAME_FOR_USER_DATA_1 = "checkUserDataCache1";
	public static final String CACHENAME_FOR_OLD_DATA = "oldDataParamsCache";

	/**
	 * 网贷之家缓存-token
	 */
	public static final String CACHENAME_FOR_INTERLOANHOME_TOKEN = "interLoanHomeToken";
	
	
	/**
	 * 删除用户资料记录状态值
	 */
	public static final int USER_DATA_DEL_RECORD_STATUS_NEW = 1;//新建
	public static final int USER_DATA_DEL_RECORD_STATUS_DELED = 2;//已删除
	
	public static final int SYSTEM_AUTO_ASSIGN_HESITATE_DAYS = 10;
	
	/**
	 * session中保存的UK值的key
	 */
	public static final String BUSINESS_RANDOM_CODE="BUSINESS_RANDOM_CODE";
	
	/**
	 * 推荐用户的关联类型
	 */
	public static final byte RECOMMEND_TYPE_AUTO=0;//自动关联
	public static final byte RECOMMEND_TYPE_HAND=1;//手动关联
	
	
	/**
	 * 搜索相关
	 */
	public static final String CHECK_SEARCH_FIELD="from";//检查参数的哪个字段
	public static final byte SEARCH_FIELD_OTHER=0;//通过其它
	
	public static final int URL_SAVE_TIME = 60;//记录当前Ip所访问的url的保存时间
	
	
	public static final int DEAL_MEMBER_VISITRECORD_TIMER = 1;//每隔多少分钟保存一次(分钟)
	public static final int DEAL_MEMBER_VISITRECORD_TOPLIMIT = 500;//超过一定量则不保存
	
	/**
	 * 在内存中记录每个用户访问的url记录时间(秒)
	 */
	public static final int DEAL_MEMBER_IP_REQUEST_RECORD_TIMER=60;
	/**
	 * 在内存中保存ip黑名单的时间(秒)
	 *	短时间的限制用户的非法请求
	 */
	public static final int MEMBER_SAVE_IP_BLACK_TIMER=60;
	public static final int MEMBER_IP_BLACK_HARDPAN_TIMER=10;//内存中的黑名单多少时间保存到内存中(分)
	
	
	public static final int REQUEST_URL_ONETIME_TOPLIMIT = 10;//指定时间内最大的请求次数
	public static final int REQUEST_URL_ONETIME_VALUS = 5;//指定时间为5(秒)
	
	//技术人员后台账号名称 -- 用于 查看系统、缓存信息及操作等
	public static final String TECHNICIAN_ADMIN_NAME = "mgrsupertempcjt";
	
	/**
	 * 首页缓存时间
	 */
	public static final Integer INDEX_CACHE_TIME = 30;//分钟
	
	
	/**
	 * 保存短信业务的获取验证码的时间key
	 */
	public static final String MESSAGE_SERVICE_CODE_TIME = "MESSAGE_SERVICE_CODE_TIME";
	/**
	 * 保存短信业务的获取验证码的值key
	 */
	public static final String MESSAGE_SERVICE_CODE_VALUE = "MESSAGE_SERVICE_CODE_VALUE";

	public static final Integer MESSAGE_SERVICE_MONEY=2;//短信订制业务费用(元)
	
	public static final byte MESSAGE_SERVICE_STATUS_DISABLED = 0;//不可用
	public static final byte MESSAGE_SERVICE_STATUS_OPEN = 1;//开通
	public static final byte MESSAGE_SERVICE_STATUS_HASCLOSE = 2;//已取消
	
	//发送通知的状态 
	public static final Integer NOTICE_STATUS_SEND=1;//发送
	public static final Integer NOTICE_STATUS_NOSEND=0;//不发送
	
	//标确认视频状态
	public static final int TENDER_ENSURE_VIDEO_STATUS_WAIT = 0;//待审核
	public static final int TENDER_ENSURE_VIDEO_STATUS_ENSURE = 1;//终审完成
	public static final int TENDER_ENSURE_VIDEO_STATUS_WAIT_RELZ = 2;//待重新录制
	public static final int TENDER_ENSURE_VIDEO_STATUS_FAIL = 3;//失败（流标）
	//视频类型
	public static final int TENDER_ENSURE_VIDEO_TYPE_LOAN = 1;//标确认视频
	public static final int TENDER_ENSURE_VIDEO_TYPE_REPAY = 2;//还款视频(老用户)
	
	//审核标补充用户材料
	public static final int TENDER_CHECK_REUSERDATA_NO_COMPLETE = 0;//未完成材料补充
	public static final int TENDER_CHECK_REUSERDATA_COMPLETE = 1;//完成材料补充
	
	//体验店状态
	public static final int CES_STATUS_DISABLED = 0;//禁用的
	public static final int CES_STATUS_USABLE = 1;//可用的
	
	//体验店提现状态
	public static final int CES_WITH_DRAW_STATUS_WAIT = 0;//未审核
	public static final int CES_WITH_DRAW_STATUS_PASS = 1;//审核通过
	public static final int CES_WITH_DRAW_STATUS_REJECT = 2;//审核不通过
	
	
	
	
	
	//总部管理员受理体验店提现
	public static final int CES_WITH_DRAW_APPLYTYPE_PASS = 1;//通过
	public static final int CES_WITH_DRAW_APPLYTYPE_REJECT = 2;//拒绝
	
	//体验店流水类型
	public static final int CES_FUNDS_INFO_TYPE_CLEAR_TO_INCOME = 1;//月度利润结算
	public static final int CES_FUNDS_INFO_TYPE_WITH_DRAW_OUTGO = 2;//提现支出
	public static final int CES_FUNDS_INFO_TYPE_WITH_DRAW_NO_INCOME = 3;//提现未批准
	public static final int CES_FUNDS_INFO_TYPE_ADJUST = 4;//后台管理员调整
	
	//邀请码类型
	public static final int CODE_TYPE_FRANCHISEE = 1;//加盟商邀请码
	public static final int CODE_TYPE_SHOWROOM = 2;//体验店邀请码
	
	//体验店月度结算状态
	public static final byte CES_RANGE_STATISTICS_STATUS_NO = 0;//未结算
	public static final byte CES_RANGE_STATISTICS_STATUS_YES = 1;//已结算
	
	//手机上注册时的提交信息的唯一验证码
	public static final String  REG_MOBILE_CODE_TOKEN="regMobileCodeToken";
	//获取手机注册时验证码的时间 
	public static final String  REG_MOBILE_CODE_TIME="regMobileCodeTime";
	//获取手机注册时验证码的值
	public static final String  REG_MOBILE_CODE_VALUE="regMobileCodeValue";
	//获取验证时用的手机号
	public static final String REG_MOBILE_CODE_TEL = "regMobileCodeTel";
	
	public static final int REGIEST_TYPE_PC = 0;//电脑邮箱注册
	public static final int REGIEST_TYPE_MOBILE = 1;//手机注册
	public static final int REGIEST_TYPE_PC_MOBILE=10;//电脑上的手机号注册
	public static final int REGIEST_TYPE_MOBILE_MOBILE=11;//手机上的手机号注册
	
	
	
	public static final String MYASKTYE_MOBILE = "myasktypemobile";//访问方式，手机
	public static final String MYASKTYE_PC = "myasktypepc";//访问方式，电脑
	/**
	 * 国付宝支付功能状态
	 */
	public static final Integer GOPAY_WITHDRAW_STATUS_WAIT_SEND = 0;//待发送
	public static final Integer GOPAY_WITHDRAW_STATUS_APPLY_FAIL = 1;//申请失败
	public static final Integer GOPAY_WITHDRAW_STATUS_APPLY_SUCCESS = 2;//申请成功
	public static final Integer GOPAY_WITHDRAW_STATUS_FIRST_CHECK_REFUSE = 3;//初审拒绝
	public static final Integer GOPAY_WITHDRAW_STATUS_RECHECK_REFUSE = 4;//复审拒绝
	public static final Integer GOPAY_WITHDRAW_STATUS_PAY_FAIL = 5;//付款失败
	public static final Integer GOPAY_WITHDRAW_STATUS_RETURN_COMPLETE = 6;//退款完成
	public static final Integer GOPAY_WITHDRAW_STATUS_BAD_DATA = 7;//非法数据
	public static final Integer GOPAY_WITHDRAW_STATUS_PAY_SUCCESS = 8;//付款成功
	
	/**
	 * 优势联动充值订单返回码
	 */
	public static final String RECHARGE_UMP_STATUS_WAIT_PAY = "WAIT_BUYER_PAY";//待付款
	public static final String RECHARGE_UMP_STATUS_SUCCESS = "TRADE_SUCCESS";//充值成功
	public static final String RECHARGE_UMP_STATUS_CLOSE = "TRADE_CLOSED";//交易关闭
	public static final String RECHARGE_UMP_STATUS_CANCLE = "TRADE_CANCEL";//交易撤销
	public static final String RECHARGE_UMP_STATUS_FAIL = "TRADE_FAIL";//交易失败
	
	/**
	 * UMP签约用户状态
	 */
	public static final int UMP_SMS_USER_STATUS_WAIT_SIGN = 0;//待签约
	public static final int UMP_SMS_USER_STATUS_SIGN = 1;//已签约
	public static final int UMP_SMS_USER_STATUS_UNWIND = 2;//解约
	public static final int UMP_SMS_USER_STATUS_TEMP = 3;//临时状态（用于用户借款）
	
	/**
	 * 优势联动返回码 -- 成功
	 */
	public static final String UMP_RET_CODE_SUCCESS = "0000";
	
	/**
	 * 联动优势回款通-手机支付签约用户激活标识 
	 */
	public static final String UMP_SMS_USER_ACTIVE_YES = "0";//已激活
	public static final String UMP_SMS_USER_ACTIVE_NO = "1";//未激活
	
	/**
	 * 回款通-手机支付业务类型
	 */
	public static final int UMP_SMS_BUSINESS_TYPE_CANCLE = 0;//解约
	public static final int UMP_SMS_BUSINESS_TYPE_SIGN = 1;//签约
	
	/**
	 * 财经道对接新旧用户类型
	 */
	public static final int NEW_USER = 0;//新用户
	public static final int OLD_USER = 1;//老用户
	
	//第三方用户类型
	public static final int CJD_THIRD_ID=1;//财经道用户
	public static final int REGISTER_GRANT_TYPE=1;//财经道红包
	
	public static final int AUDIT_PASS=0;//审核通过（交易成功）
	public static final int ALREADY_TENDER=2;//已投标（投标成功）
	public static final int TENDER_FAILLED=1;//流标
	
	public static final int TENDER_ADVANCE_STATUS_PAYED = 1;  //运营商已垫付
	public static final int TENDER_ADVANCE_STATUS_UNPAYED = 0; //运营商未垫付
	
	/**
	 * 运营商保证金操作类型
	 */
	public static final int RISK_BAIL_POOL_RECHARGE = 1; //充入保证金
	public static final int RISK_BAIL_POOL_ADVANCE = 2;  //垫付还款
	public static final int RISK_BAIL_POOL_PENAL = 3;    //罚金
	
	/**
	 * 首次借款金额限制
	 */
	public static final double FIRST_PUBLISH_TENDER_AMOUNT = 60000.00;
	
	
	/**
	 * 记录邮箱短信内容 
	 */
	public static final String CACHENAME_FOR_MAILSEND = "mailSendCache" ;//邮箱发送信息缓存
	public static final String CACHENAME_FOR_MAILREGISTERSEND = "mailRegisterSendCache" ;//用户激活邮件缓存
	public static final String CACHENAME_FOR_MESSAGESEND = "messageSendCache" ;//系统手机发送信息缓存
	public static final String CACHENAME_FOR_CHECKCODESEND = "checkCodeSendCache" ;//手机验证码信息缓存
	public static final String CACHENAME_FOR_MESSAGEIMPORTANTSEND = "messageImportantSendCache" ;//重要信息发送缓存
	public static final String CACHENAME_FOR_MOBILESOUNDCODE = "mobileSoundCodeCache" ;//手机语音验证码信息缓存(语音验证码)
	
	/**
	 * 缓存记录类型
	 */
	public static final int CACHE_MSG_TYPE_EMAIL = 1;//邮件
	public static final int CACHE_MSG_TYPE_MOBILE = 2;//普通短信
	public static final int CACHE_MSG_TYPE_IM_MSG = 3;//重要短信
	public static final int CACHE_MSG_TYPE_EMAIL_REGISTER = 4;//注册激活邮件
	public static final int CACHE_MSG_TYPE_MOBILE_CHECKCODE = 5;//手机验证码
	public static final int CACHE_MSG_TYPE_MOBILE_CHECKSOUNDCODE = 6;//手机验证码(语音)
	public static final int CACHE_MSG_TYPE_RECHARGE = 7;// 充值业务
	public static final int CACHE_MSG_TYPE_DRAW_MONEY = 8;// 提现业务
	public static final int CACHE_MSG_TYPE_BORROW = 9;// 借入业务
	public static final int CACHE_MSG_TYPE_LEND = 10;// 贷出业务
	public static final int CACHE_MSG_TYPE_GUARANTEE = 11;// 担保业务
	public static final int CACHE_MSG_TYPE_CREDIT_ASSIGNMENT_SALE = 12;// 债权转让人
	public static final int CACHE_MSG_TYPE_CREDIT_ASSIGNMENT_BUY = 13;// 债权竞拍人
	public static final int CACHE_MSG_TYPE_GROUP = 14;// 群组好友业务
	public static final int CACHE_MSG_TYPE_OTR = 15;// 评论审核短信群发等公共业务
	
	/**
	 * 缓存记录状态
	 */
	public static final int CACHE_MSG_STATUS_UN = 0;//未处理
	public static final int CACHE_MSG_STATUS_IN = 1;//已处理
	
	/**
	 * 注册加密方式
	 */
	public static final int REGIEST_ENCODE_PASSWORD_EMAIL = 0;//邮箱加密
	public static final int REGIEST_ENCODE_PASSWORD_MOBILE = 1;//手机加密
	
	/**
	 *  自动登陆标志
	 */
	public static final String AUTO_LOGIN_MEMBER = "autoLoginMember";
	/**
	 * 密码强度
	 */
	public static final String CURRENT_MEMBER_PASSWORD_LEVEL = "passwordLevle";
	
	/**
	 * 用户自己获取资料 O
	 */
	public static final int MEMBER_OPERATE_MATERIAL = 0;
	/**
	 * 管理员获取资料 1
	 */
	public static final int ADMIN_OPERATE_MATERIAL = 1;
	
	/**
	 * 标记为重要材料
	 */
	public static final int DATUM_LEVEL_YES_OR_NO =0;//可选的
	public static final int DATUM_LEVEL_FLAG_FALSE = 1;//普通材料
	public static final int DATUM_LEVEL_FLAG_TRUE = 2;//是重要材料（运营商标记）
	public static final int DATUM_LEVEL_SYS_FLAG_TRUE =3;//系统标记的重材料,用户是必须上传的
	public static final int DATUM_LEVEL_MATERIAL = 4;//提现材料
	
	/**
	 * 材料等级,总共5个级别,使用级别可以计算当前用户的借款分值
	 */
	public static final int DATUM_LEVEL_NUMBER_ONE = 1;
	public static final int DATUM_LEVEL_NUMBER_TWO = 2;
	public static final int DATUM_LEVEL_NUMBER_THREE = 3;
	public static final int DATUM_LEVEL_NUMBER_FOUR = 4;
	public static final int DATUM_LEVEL_NUMBER_FIVE = 5;
	public static final int DATUM_LEVEL_SYS = 6;
	
	 /**
	  * 标记借款材料征信报告逾期金额数据
	  */
	public static final int ACCOUNT_OVERDUE_NO=0 ; //未逾期或透支
	public static final int ACCOUNT_OVERDUE_YES = 1; //逾期或透支
	
	/**
	 * 信用卡或借记卡使用状态
	 */
	public static final int ACCOUNT_USE_STATUS_NOTACTIVE =0;//未激活
	public static final int ACCOUNT_USE_STATUS_OK =1;//使用正常
	public static final int ACCOUNT_USE_STATUS_LOGOFF =2;//已注销
	
	/**
	 * 住房贷当前贷款状态
	 */
	public static final int HOUSELOAN_STATUS_OVER = 0;//已结清
	public static final int HOUSELOAN_STATUS_HaveInHand = 1;//正在还款中
	
	/**
	 * 管理员查询会员条件来源：1体验店客户 2运营商客户 3自由客户
	 */
	public static final int ADMIN_FIDN_MEMBER_CES = 1;
	public static final int ADMIN_FIDN_MEMBER_AREA = 2;
	public static final int ADMIN_FIDN_MEMBER_FREE = 3;

    /**
     * 抽奖机会获得方式
     */
    public static final int DRAW_CHANCE_TYPE_1 = 1;//注册
    public static final int DRAW_CHANCE_TYPE_2 = 2;//首次充值
    public static final int DRAW_CHANCE_TYPE_3 = 3;//首次投资
    public static final int DRAW_CHANCE_TYPE_4 = 4;//推荐的新用户投资成功
    public static final int DRAW_CHANCE_TYPE_5 = 5;//投资累积到1W元
    public static final int DRAW_CHANCE_TYPE_6 = 6;//推荐的新用户通过手机认证
	public static final int DRAW_CHANCE_TYPE_7 = 7;//历史投资上1W (14中秋活动)
	public static final int DRAW_CHANCE_TYPE_8 = 8;//投资累计到5000(国庆活动)
    /**
     * 抽奖结果
     */
    public static final int DRAW_RESULT_TYPE_1 = 1;//红包奖励
    public static final int DRAW_RESULT_TYPE_2 = 2;//5S

    public static final int DRAW_RESULT_MONEY_DAYS = 45;//抽奖红包有效期(天)

	/**
	 * 抽奖机会状态
	 */
	public static final int DRAW_CHANCE_STATUS_0 = 0;//已使用
	public static final int DRAW_CHANCE_STATUS_1 = 1;//未使用
	public static final int DRAW_CHANCE_STATUS_2 = 2;//已过期
	
	/**
	 * 抽奖结果状态
	 */
	public static final int DRAW_RESULT_STATUS_0 = 0;//已使用
	public static final int DRAW_RESULT_STATUS_1 = 1;//未使用
	public static final int DRAW_RESULT_STATUS_2 = 2;//已过期
	public static final int DRAW_RESULT_STATUS_3 = 3;//投标中
	
	/**
	 * 预投标状态
	 */
	public static final int YU_TOU_RUNING_1=1;//预投中
	public static final int YU_TOU_END_2=2;//预投满进度结束
	public static final int YU_TOU_PUBLISH_3=3;//强行发布
	public static final int YU_TOU_CANCEL_4=4;//取消预投标
	
	
	public static double DD_INTER=0.204;//DD借款固定利率
	public static final int APP_IMG_MAX_NUMBER = 50;
	
	/**
	 * 产品相关资金流水-产品类型
	 */
	public static final int PRO_COMM_FUNDS_INFO_PROTYPE_WMPS = 1;//翼存宝
	/**
	 * 产品相关资金流水-流水类型
	 */
	public static final int PRO_COMM_FUNDS_INFO_TYPE_INCOME_WMPS_INTER = 1;//翼存宝收益利息
	
	//翼企贷中不需要录入表单数据的材料
	public static final int EXTER_LOAN_IMPORT_DATA_INDUSTRY= 57;//企业工商查证
	public static final int EXTER_LOAN_IMPORT_DATA_AUTHO = 58;//征信查询授权书-法人\个人
	
	//抵扣劵
	/**
	 * 体验用户注册推荐人奖励抵扣券额度
	 */
	public static final Double REGISTER_AWARD_LIMIT = 8.0;
	   
	/**
	 * 抵扣券状态
	 * 1.已使用,2.未使用,3.已过期,0未激活
	 */
	public static final int AWARD_STATUS_GRANT = 0 ;//未激活
	public static final int AWARD_STATUS_USE = 1 ;
	public static final int AWARD_STATUS_NOUSE = 2 ;
	public static final int AWARD_STATUS_OVERDUE = 3 ;
	
	/**
	 * 手机随机码到期时间
	 */
	public static final int MOBILE_OVERDUE_DATE = 1451577599;//2015-12-31 23:59:59
	/**
	 * 平台催收账户表 类型 d_platform_account
	 */
	public static final int PLATFORM_ACCOUNT_TYPE_ONE = 1;//收入
	public static final int PLATFORM_ACCOUNT_TYPE_TWO = 2;//利息支出
	public static final int PLATFORM_ACCOUNT_TYPE_THREE = 3; //本金支出
	public static final int PLATFORM_ACCOUNT_TYPE_FOUR = 4; //罚息支出
	public static final int PLATFORM_ACCOUNT_TYPE_FIVE = 5; //罚息收入

	
	/**
	 * 免扣除保险费金额标(name)
	 */
	public static final String TENDER_FREE_INSURE_FINANNAME = "MaxFreeInsurance"; 

	
	/**
	 * 知识库问题删除状态
	 */
	public static final int KNOWLEDGE_STATUS_TYPE_ONE = 1;//未删除
	public static final int KNOWLEDGE_STATUS_TYPE_TWO = 2;//已删除
	
	public static final byte FUNDS_INFO_TYPE_WUT_SYS_DF_BACK = 73;//系统垫付回款
	/**
	 * d_send_third_tender 标类型
	 */
	public static final int SEND_THIRD_TENDER_TYPE_QTB = 1;//其它标
	public static final int SEND_THIRD_TENDER_TYPE_YCB = 2;//翼存宝
	public static final int SEND_THIRD_TENDER_TYPE_YXJ = 3;//翼星计划
	
	public static final String SEND_THIRD_TENDER_TYPE_QT = "qtb";//其它标
	public static final String SEND_THIRD_TENDER_TYPE_YC = "ycb";//翼存宝
	public static final String SEND_THIRD_TENDER_TYPE_YX = "yxj";//翼星计划

	/**
	 * 公开图片状态
	 */
	public static final int IMAGE_PUBLIC_OUT = 0;//公开
	public static final int IMAGE_NO_PUBLIC_OUT = 1;//不公开

	public static final String PAGE_COUNT="pageCount";
	public static final String PAGE_LIST = "pageList";

	//重要日志类型
	/**
	 * 日志类型：发息
	 */
	public static final Integer OPERATELOG_LOGTYPE_INTERWRAP = 1;
	public static final Integer OPERATELOG_LOGTYPE_TEST_INTERWRAP = 5;

	/**
	 * 日志类型：结束产品
	 */
	public static final Integer OPERATELOG_LOGTYPE_OVERDUEFOREND = 2;
	public static final Integer OPERATELOG_LOGTYPE_OVERDUEFORFINISH = 3;
	public static final Integer OPERATELOG_LOGTYPE_OVERDUE = 4;

	/**
	 * 日志任务状态：0：未处理1：正在处理2：已经成功处理3:失败
	 */
	public static final Integer OPERATELOG_STATUS_UNTREATED= 0;
	public static final Integer OPERATELOG_STATUS_PROCESSING= 1;
	public static final Integer OPERATELOG_STATUS_SUCEESS= 2;
	public static final Integer OPERATELOG_STATUS_FAILURE= 3;


	/**
	 * 日志任务优先级
	 */
	public static final Integer OPERATELOG_PRI_ONE= 1;
	public static final Integer OPERATELOG_PRI_TWO= 2;
	public static final Integer OPERATELOG_PRI_THREE= 3;
	public static final Integer OPERATELOG_PRI_FOUR= 4;
	public static final Integer OPERATELOG_PRI_FIVE= 5;
	public static final Integer OPERATELOG_PRI_SIX= 6;

	/**
	 * 日志任务自动执行
	 */
	public static final Integer OPERATELOG_AUTOREDO_FALSE= 0;
	public static final Integer OPERATELOG_AUTOREDO_TRUE= 1;


	public static final String WMPS_FUNDSINFO_DESCRIPTION = "购买翼农计划利息";//翼存宝发息添加资金流水备注


	public static final Integer WMPS_INTERWRAP_BATCHUSERSIZE = 500;//定时任务：发息批量处理用户数
	public static final Integer WMPS_INTERWRAP_BATCHCOMMITSIZE = 5000;//定时任务：发息批量提交限制额度
	public static final Integer WMPS_INTERWRAP_BATCHDUBBOSIZE = 50;//定时任务：发息批量提交限制额度
	public static final Integer WMPS_OVERDUEFORENDWRAP_BATCHUSERSIZE = 100;//定时任务：结束过期理财产品每次处理用户数
	//解决一个标两次融资的操作类型
	public static final int CHANGE_TO_PROCAST_TENDER = 1; //预投标操作
	public static final int BATCH_ADD_NEW_USER_TENDER = 2;   //新手标操作
	public static final int ADMIN_BATCH_PUBLISH_TENDER = 3; //发布、批量发布操作
	public static final int CREATE_WMPS_TENDER = 4; //加入债权池操作


	/**
	 * 第三方标状态
	 */
	public static final int TENDER_THIRDPARTY_STATUS_MATCH_NO = 1;//状态:未匹配
	public static final int TENDER_THIRDPARTY_STATUS_UNUSABLE = 3;//状态：不可用的(流标等)
	public static final int TENDER_THIRDPARTY_STATUS_NOMATCH_WMPSEND = 4;//产品结束未匹配
	public static final int TENDER_THIRDPARTY_STATUS_MATCH_RECORD = 5;//状态:已匹配产品
	public static final int TENDER_THIRDPARTY_STATUS_REPLACE = 6;//状态:替换
	public static final int TENDER_THIRDPARTY_STATUS_MATCH_TENDER = 2;//状态:已匹配

	/**
	 * 二次贷标志
	 */
	public static final int TENDER_REVIEW_TYPE_1=1;//通过
	public static final int TENDER_REVIEW_TYPE_3=3;//预审通过
	public static final int TENDER_REVIEW_TYPE_4=4;//4-核准通过
	public static final int CREATE_WMPS_TENDER_CANJOINWMPS_0 =0;//0-不能加入
	public static final int CREATE_WMPS_TENDER_CANJOINWMPS_1 =1;//1-可以加入

	/**
	 * 新风控的系统参数
     */
	public static final String NBACK_AREACODE_SYSTEMKEY="5FD3A9868D4944CCB0543F22660891CD";//通过

	/**
	 *d_borrow_concat
	 * 关联人类别 1 担保人 2 共借人 3 配偶投保 4紧急联系人
	 */
	public static final int BORROW_CONCAT_TYPE_1=1;//担保人
	public static final int BORROW_CONCAT_TYPE_2=2;//共借人
	public static final int BORROW_CONCAT_TYPE3=3;//配偶投保
	public static final int BORROW_CONCAT_TYPE_4 =4;//紧急联系人
	public static final int BORROW_CONCAT_TYPE_5 =5;//配偶



}
