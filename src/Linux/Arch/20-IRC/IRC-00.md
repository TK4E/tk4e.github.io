# IRC-00


```text
# 注册(可选) {
/nick YourNick
    # 设置用户名

/msg nickserv register password email
    # 注册
# }




# 删除帐号 {
/msg NickServ DROP nick
# }


# 注册频道 {
/join #xxx

/msg ChanServ REGISTER #xxx
    # 注册 xxx 频道(需确保频道未被注册)
# }



/msg ChanServ SET #acg GUARD ON
    # 设置频道机器人


/msg ChanServ op #xxx yyy
    # 设置 Tyyy 为 #xxx 的管理员


```
