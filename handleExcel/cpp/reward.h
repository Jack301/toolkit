/*
*
* Copyright 2016
* All rights reserved.
* This file is automatically generated by python script of which 
* the author is wupeng.
*
*/

#pragma once

#include <lib_file_tab_txt.h>
#include <lib_util.h>

namespace reward_auto{
	struct certain_t{
		uint32_t certain_type;
		uint32_t certain_id;
		uint32_t certain_value;
	};
	struct maybe_t{
		uint32_t maybe_type;
		uint32_t maybe_id;
		uint32_t maybe_value;
		uint32_t maybe_probability;
	};

	struct reward_cfg_t
	{
		uint32_t id;		//id	
		std::string name;		//物品名称	
		uint16_t probability;		//可能奖励出现概率（千分比）	
		uint8_t min;		//可能奖励最小数量	
		uint8_t max;		//可能奖励最大数量	
		std::vector<uint32_t> activity;		//受活动控制id	
		std::vector<certain_t> reward_certain;		//必掉奖励类型1货币_货币类型（1金币 2绑定钻石 3钻石）_数量 2经验_0_数量3物品_ID_数量 4体力_0_数量	
		std::vector<maybe_t> reward_maybe;		//可能奖励类型1货币_货币类型（1金币 2绑定钻石 3钻石）_数量_概率2经验_0_数量_概率3物品_ID_数量_概率 4体力_0_数量_概率	

		void load(el::lib_file_tab_txt_t& file_tab_txt, std::vector<std::string>& ref){
			std::string __str_def__;

			this->id= file_tab_txt.get_val_def("id", ref, 0);
			this->name= file_tab_txt.get_val_def("name", ref, __str_def__);
			{
				std::string str_array = file_tab_txt.get_val_def("reward_certain", ref, __str_def__);
				auto para_vec = el::g_cat_string<std::string>(str_array, ';', '_');

				FOREACH(para_vec, it){
					certain_t certain;
					std::vector<std::string>& u_vec = *it;
					el::convert_from_string(certain.certain_type, u_vec[0]);
					el::convert_from_string(certain.certain_id, u_vec[1]);
					el::convert_from_string(certain.certain_value, u_vec[2]);
					this->reward_certain.push_back(certain);
				}
			}
			{
				std::string str_array = file_tab_txt.get_val_def("reward_maybe", ref, __str_def__);
				auto para_vec = el::g_cat_string<std::string>(str_array, ';', '_');

				FOREACH(para_vec, it){
					maybe_t maybe;
					std::vector<std::string>& u_vec = *it;
					el::convert_from_string(maybe.maybe_type, u_vec[0]);
					el::convert_from_string(maybe.maybe_id, u_vec[1]);
					el::convert_from_string(maybe.maybe_value, u_vec[2]);
					el::convert_from_string(maybe.maybe_probability, u_vec[3]);
					this->reward_maybe.push_back(maybe);
				}
			}
			this->probability= file_tab_txt.get_val_def("probability", ref, 0);
			this->min= file_tab_txt.get_val_def("min", ref, 0);
			this->max= file_tab_txt.get_val_def("max", ref, 0);
			{
				std::string array = file_tab_txt.get_val_def("activity", ref, __str_def__);
				el::g_cat_string(this->activity, array, '_');
			}		
		}
	};
}