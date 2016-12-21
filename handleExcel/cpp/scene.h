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

namespace scene_auto{

	struct scene_cfg_t
	{
		uint32_t id;		//ID	
		std::string name;		//地图名称	
		std::string file;		//文件名	
		uint8_t type;		//场景类型1大地图（后端实时坐标）2城镇&野外地图（无需实时地图）3战斗地图（全3D）4活动地图	
		uint8_t limit_type;		//场景进入限制//限制类型_限制数据1等级限制_等级2任务限制_任务id3杀怪_怪物id0	
		uint32_t limit_data;		//场景进入限制//限制类型_限制数据1等级限制_等级2任务限制_任务id3杀怪_怪物id0	
		uint8_t horse_limit;		//场景特殊类型主要限制坐骑1天空2海洋0无特殊能力	
		std::vector<uint32_t> limit_area_into;		//区域限制条件子表ID	
		uint16_t coordinates_x;		//地图出生点//X坐标_Y坐标	
		uint16_t coordinates_y;		//地图出生点//X坐标_Y坐标	
		std::vector<uint32_t> music_id;		//音乐子表id	
		uint8_t create_type;		//创建方式:0 预设创建1 动态创建(组队副本，攻城战)	
		std::vector<uint32_t> waypoint_id;		//通道表id	

		void load(el::lib_file_tab_txt_t& file_tab_txt, std::vector<std::string>& ref){
			std::string __str_def__;

			this->id= file_tab_txt.get_val_def("id", ref, 0);
			this->name= file_tab_txt.get_val_def("name", ref, __str_def__);
			this->file= file_tab_txt.get_val_def("file", ref, __str_def__);
			this->type= file_tab_txt.get_val_def("type", ref, 0);
			this->limit_type= file_tab_txt.get_val_def("limit_type", ref, 0);
			this->limit_data= file_tab_txt.get_val_def("limit_data", ref, 0);
			this->horse_limit= file_tab_txt.get_val_def("horse_limit", ref, 0);
			{
				std::string array = file_tab_txt.get_val_def("limit_area_into", ref, __str_def__);
				el::g_cat_string(this->limit_area_into, array, '_');
			}
			this->coordinates_x= file_tab_txt.get_val_def("coordinates_x", ref, 0);
			this->coordinates_y= file_tab_txt.get_val_def("coordinates_y", ref, 0);
			{
				std::string array = file_tab_txt.get_val_def("music_id", ref, __str_def__);
				el::g_cat_string(this->music_id, array, '_');
			}
			this->create_type= file_tab_txt.get_val_def("create_type", ref, 0);
			{
				std::string array = file_tab_txt.get_val_def("waypoint_id", ref, __str_def__);
				el::g_cat_string(this->waypoint_id, array, '_');
			}		
		}
	};
}
