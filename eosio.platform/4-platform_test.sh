#!/bin/bash

contracts_dir=/home/jason/center_project/bes/src/build_eosforbes/build/contracts

#显示执行的命令
set -xv

#create system accounts
cleos create account eosio eosio.msig EOS6An9TxNk3mqKnRX9y92UJbWXEPSUxLD2PEtD9eTZfuBeHxBDpD
cleos create account eosio eosio.names EOS6An9TxNk3mqKnRX9y92UJbWXEPSUxLD2PEtD9eTZfuBeHxBDpD
cleos create account eosio eosio.ram EOS6An9TxNk3mqKnRX9y92UJbWXEPSUxLD2PEtD9eTZfuBeHxBDpD
cleos create account eosio eosio.ramfee EOS6An9TxNk3mqKnRX9y92UJbWXEPSUxLD2PEtD9eTZfuBeHxBDpD
cleos create account eosio eosio.stake EOS6An9TxNk3mqKnRX9y92UJbWXEPSUxLD2PEtD9eTZfuBeHxBDpD
cleos create account eosio eosio.token EOS6An9TxNk3mqKnRX9y92UJbWXEPSUxLD2PEtD9eTZfuBeHxBDpD
cleos create account eosio eosio.rpay EOS6An9TxNk3mqKnRX9y92UJbWXEPSUxLD2PEtD9eTZfuBeHxBDpD

#set token contract,and msig contract
cleos set contract eosio.token $contracts_dir/eosio.token/
cleos set contract eosio.msig $contracts_dir/eosio.msig/

#create and issue EOS token
cleos push action eosio.token create '["eosio", "10000000000.0000 EOS"]' -p eosio.token
cleos push action eosio.token issue '["eosio", "1000000000.0000 EOS", "memo"]' -p eosio

#get balance for eosio
cleos get account eosio
cleos get currency balance eosio.token eosio

sleep 0.5

#set platform contract 
cleos set contract eosio  $contracts_dir/eosio.platform/
sleep 0.5

#set msig priv
cleos push action eosio setpriv '["eosio.msig", 1]' -p eosio@active

#get balance for eosio
cleos get account eosio
cleos get currency balance eosio.token eosio

#create accounts
cleos system newaccount --transfer --stake-net "100.0000 EOS" --stake-cpu "100.0000 EOS" --buy-ram "10.0000 EOS" eosio producer1  EOS7tSY5od1Hu7hMvParp3VfWzXyhvhiCPZjq1XMDWZb7s84C1n1F

cleos system newaccount --transfer --stake-net "100.0000 EOS" --stake-cpu "100.0000 EOS" --buy-ram "10.0000 EOS" eosio producer2  EOS6cmDXn5mqxe9L5n1jB4TSfgZd8b2jbtNibe8EHrygjrmLf4oRN
cleos system newaccount --transfer --stake-net "100.0000 EOS" --stake-cpu "100.0000 EOS" --buy-ram "10.0000 EOS" eosio producer3 EOS7CRLbXJNsQvUCcGggAqoqbco8tydpMYZiPLv8A1v3FFV8rwauL
cleos system newaccount --transfer --stake-net "100.0000 EOS" --stake-cpu "100.0000 EOS" --buy-ram "10.0000 EOS" eosio producer4 EOS6oxALYnrJveHMTBYPq31oZ7Hwye1Pa1PvdYgJgCDkWm167GeAn
cleos system newaccount --transfer --stake-net "100.0000 EOS" --stake-cpu "100.0000 EOS" --buy-ram "10.0000 EOS" eosio voter1  EOS6537XnYata5quZyhz71QgkSmZ7h9nSR5gw15jFJppZVBavZrKq
cleos system newaccount --transfer --stake-net "100.0000 EOS" --stake-cpu "100.0000 EOS" --buy-ram "10.0000 EOS" eosio voter2  EOS7kKW1pwnoQVBakuHjRNm9yHo2ovsnswqnLjod8agbQycXTL2yP
cleos system newaccount --transfer --stake-net "100.0000 EOS" --stake-cpu "100.0000 EOS" --buy-ram "10.0000 EOS" eosio voter3  EOS6CV1CV1sLrp5qSMFnzznybTYaE4rqQSNQcQziVDZcW36MDjxE3
cleos system newaccount --transfer --stake-net "100.0000 EOS" --stake-cpu "100.0000 EOS" --buy-ram "10.0000 EOS" eosio voter4  EOS6fXvaDopGHMAPqFdqDqjnyufTbLn7wAiBTFrAyPVsE5sSbz6LD

#get balance for eosio
cleos get currency balance eosio.token producer1
cleos get currency balance eosio.token producer2
cleos get currency balance eosio.token producer3
cleos get currency balance eosio.token producer4
cleos get currency balance eosio.token voter1
cleos get currency balance eosio.token voter2
cleos get currency balance eosio.token voter3
cleos get currency balance eosio.token voter4

#transfer tokens from eosio to test accounts
cleos transfer eosio voter1 "100000000.0000 EOS"
cleos transfer eosio voter2 "100000000.0000 EOS"
cleos transfer eosio voter3 "100000000.0000 EOS"
cleos transfer eosio voter4 "100000000.0000 EOS"
cleos transfer eosio producer1 "10000.0000 EOS"
cleos transfer eosio producer2 "10000.0000 EOS"
cleos transfer eosio producer3 "10000.0000 EOS"
cleos transfer eosio producer4 "10000.0000 EOS"

#get account test
cleos get account eosio
cleos get account producer1
cleos get account producer2
cleos get account producer3
cleos get account producer4
cleos get account voter1
cleos get account voter2
cleos get account voter3
cleos get account voter4

cleos get currency balance eosio.token producer1
cleos get currency balance eosio.token producer2
cleos get currency balance eosio.token producer3
cleos get currency balance eosio.token producer4
cleos get currency balance eosio.token voter1
cleos get currency balance eosio.token voter2
cleos get currency balance eosio.token voter3
cleos get currency balance eosio.token voter4

# regproducers
cleos system regproducer producer1 EOS7tSY5od1Hu7hMvParp3VfWzXyhvhiCPZjq1XMDWZb7s84C1n1F www.hawk1.com 0 1000
cleos system regproducer producer2 EOS6cmDXn5mqxe9L5n1jB4TSfgZd8b2jbtNibe8EHrygjrmLf4oRN www.hawk2.com 0 1000
cleos system regproducer producer3 EOS7CRLbXJNsQvUCcGggAqoqbco8tydpMYZiPLv8A1v3FFV8rwauL www.hawk3.com 0 1000
cleos system regproducer producer4 EOS6oxALYnrJveHMTBYPq31oZ7Hwye1Pa1PvdYgJgCDkWm167GeAn www.hawk4.com 0 1000

#调整其他信息不报错
#cleos system regproducer producer1 EOS7tSY5od1Hu7hMvParp3VfWzXyhvhiCPZjq1XMDWZb7s84C1n1F www.hawk1.new.com 0 1000
#调整佣金率存在周期，上调producer1的佣金率到20%（报错-因为刚刚调整过，需要等待调整周期达到（目前20秒））
#cleos system regproducer producer1 EOS7tSY5od1Hu7hMvParp3VfWzXyhvhiCPZjq1XMDWZb7s84C1n1F www.hawk1.com 0 1500
#sleep 21
#cleos system regproducer producer1 EOS7tSY5od1Hu7hMvParp3VfWzXyhvhiCPZjq1XMDWZb7s84C1n1F www.hawk1.com 0 1500

#下调producer1的佣金率到1%(达到了5%的限额，应该会报错)
#cleos system regproducer producer1 EOS7tSY5od1Hu7hMvParp3VfWzXyhvhiCPZjq1XMDWZb7s84C1n1F www.hawk1.com 0 100
#sleep 21
#上调不报错
#cleos system regproducer producer1 EOS7tSY5od1Hu7hMvParp3VfWzXyhvhiCPZjq1XMDWZb7s84C1n1F www.hawk1.com 0 2000


#stake
cleos system delegatebw voter1 voter1 '10000000 EOS' '10000000 EOS'
cleos system delegatebw voter2 voter2 '20000000 EOS' '20000000 EOS'
cleos system delegatebw voter3 voter3 '30000000 EOS' '30000000 EOS'
cleos system delegatebw voter4 voter4 '40000000 EOS' '40000000 EOS'
cleos get currency balance eosio.token producer1
cleos get currency balance eosio.token producer2
cleos get currency balance eosio.token producer3
cleos get currency balance eosio.token producer4
cleos get currency balance eosio.token voter1
cleos get currency balance eosio.token voter2
cleos get currency balance eosio.token voter3
cleos get currency balance eosio.token voter4
 

#proxy voting
cleos system voteproducer prods voter1 producer1 '20000000 EOS'
cleos system voteproducer prods voter2 producer2 '40000000 EOS'
cleos system voteproducer prods voter3 producer3 '60000000 EOS'
cleos system voteproducer prods voter4 producer4 '80000000 EOS'

#select listproducers and listbw
cleos system listproducers

:<<'
#获取奖励测试
cleos get table eosio eosio voters
cleos get table eosio eosio producers

cleos get currency balance eosio.token producer1
cleos system claimrewards producer1 producer1
cleos get currency balance eosio.token producer1

cleos get currency balance eosio.token voter1
cleos system claimrewards voter1 producer1
cleos get currency balance eosio.token voter1
'



