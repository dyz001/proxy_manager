#注意事项
####需要添加的定时任务
1. 定时请求捕鱼数据， 每天凌晨一点执行 curl http://proxy.quanjianyou.com:4848/gm_gen_fish_sum_record
2. 定时汇总分配收益
   * 平台收益 每天凌晨1：30 执行 curl http://proxy.quanjianyou.com:4848/gm_sum_platform_profit
   * 捕鱼收益 每天凌晨 3:00 执行 curl http://proxy.quanjianyou.com:4848/gm_sum_fish_profit