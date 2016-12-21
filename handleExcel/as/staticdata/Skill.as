/*
*
* Copyright 2016
* All rights reserved.
* This file is automatically generated by python script of which 
* the author is wupeng.
*
*/
package staticdata
{
	import flash.utils.ByteArray;
	import staticdata.define.*

	public class Skill extends StaticInfoBase
	{
		public var id:int;		//ID
		public var advanceId:int;		//进阶技能ID
		public var maxLevel:int;		//进阶（最大等级）
		public var name:String;		//技能名称
		public var describe:String;		//技能描述
		public var icon:int;		//技能图示
		public var type:int;		//技能类型1大招2主动3被动触发4被动永久
		public var trigger:int;		//被动触发条件（概率用千分比）11自己被攻击_0_0_触发概率12队友被攻击_0_0_触发概率13自己攻击敌人_0_0_触发概率14队友攻击敌人_0_0_触发概率21自己血量到达并低于_0_千分比_触法概率22队友血量到达并低于_0_千分比_触法概率23自己血量到达并高于_0_千分比_触法概率24队友血量到达并高于_0_千分比_触法概率31特定技能_技能ID_0_0_触发概率32特定技能逻辑类型_技能类型_0_0_触发概率41自己死亡_0_0_触发概率42队友死亡_0_0_触发概率43敌方单位死亡_0_0_触发概率51暴击触发_0_0_触发概率52未命中触发_0_0_触发概率61队友增加debuff状态_0_0_触发概率62队友增加buff状态_0_0_触发概率63敌人增加debuff状态_0_0_触发概率64敌人增加buff状态_0_0_触发概率71计数器触发_计数器id（buffid)_计数器数值_触发概率
		public var valueId:int;		//被动触发条件（概率用千分比）11自己被攻击_0_0_触发概率12队友被攻击_0_0_触发概率13自己攻击敌人_0_0_触发概率14队友攻击敌人_0_0_触发概率21自己血量到达并低于_0_千分比_触法概率22队友血量到达并低于_0_千分比_触法概率23自己血量到达并高于_0_千分比_触法概率24队友血量到达并高于_0_千分比_触法概率31特定技能_技能ID_0_0_触发概率32特定技能逻辑类型_技能类型_0_0_触发概率41自己死亡_0_0_触发概率42队友死亡_0_0_触发概率43敌方单位死亡_0_0_触发概率51暴击触发_0_0_触发概率52未命中触发_0_0_触发概率61队友增加debuff状态_0_0_触发概率62队友增加buff状态_0_0_触发概率63敌人增加debuff状态_0_0_触发概率64敌人增加buff状态_0_0_触发概率71计数器触发_计数器id（buffid)_计数器数值_触发概率
		public var value:int;		//被动触发条件（概率用千分比）11自己被攻击_0_0_触发概率12队友被攻击_0_0_触发概率13自己攻击敌人_0_0_触发概率14队友攻击敌人_0_0_触发概率21自己血量到达并低于_0_千分比_触法概率22队友血量到达并低于_0_千分比_触法概率23自己血量到达并高于_0_千分比_触法概率24队友血量到达并高于_0_千分比_触法概率31特定技能_技能ID_0_0_触发概率32特定技能逻辑类型_技能类型_0_0_触发概率41自己死亡_0_0_触发概率42队友死亡_0_0_触发概率43敌方单位死亡_0_0_触发概率51暴击触发_0_0_触发概率52未命中触发_0_0_触发概率61队友增加debuff状态_0_0_触发概率62队友增加buff状态_0_0_触发概率63敌人增加debuff状态_0_0_触发概率64敌人增加buff状态_0_0_触发概率71计数器触发_计数器id（buffid)_计数器数值_触发概率
		public var probability:int;		//被动触发条件（概率用千分比）11自己被攻击_0_0_触发概率12队友被攻击_0_0_触发概率13自己攻击敌人_0_0_触发概率14队友攻击敌人_0_0_触发概率21自己血量到达并低于_0_千分比_触法概率22队友血量到达并低于_0_千分比_触法概率23自己血量到达并高于_0_千分比_触法概率24队友血量到达并高于_0_千分比_触法概率31特定技能_技能ID_0_0_触发概率32特定技能逻辑类型_技能类型_0_0_触发概率41自己死亡_0_0_触发概率42队友死亡_0_0_触发概率43敌方单位死亡_0_0_触发概率51暴击触发_0_0_触发概率52未命中触发_0_0_触发概率61队友增加debuff状态_0_0_触发概率62队友增加buff状态_0_0_触发概率63敌人增加debuff状态_0_0_触发概率64敌人增加buff状态_0_0_触发概率71计数器触发_计数器id（buffid)_计数器数值_触发概率
		public var costType:int;		//技能消耗1怒气_数量（千分比）2怒气_数值3生命_数量（千分比）4XX_数量5消耗道具_数量0无消耗
		public var costValue:int;		//技能消耗1怒气_数量（千分比）2怒气_数值3生命_数量（千分比）4XX_数量5消耗道具_数量0无消耗
		public var logicId:Array;		//逻辑子表ID
		public var logicMaybeId:Array;		//可能转换逻辑ID
		public var logicProbability:int;		//可能逻辑概率（千分比）
		public var growControl:Array;		//成长系数控制值1触发概率数值（probability）2可能逻辑概率（logic_probability）
		public var growCoefficient:int;		//成长系数(千分比)
		public var musicAtkId:int;		//攻击音效id
		public var musicBallisticId:int;		//弹道音效id
		public var musicStruckId:int;		//受击音效id
		public var skillWeight:int;		//技能权重
		public var lens:int;		//镜头配置id1配置12配置2
		public var readyActionFile:int;		//吟唱动作id
		public var readyEffectId:int;		//吟唱特效id
		public var readyEffectAdd:Array;		//吟唱特效需求效果1叠加2XX
		public var readyTime:int;		//吟唱动作播放时间(毫秒 1秒=1000毫秒)
		public var actionFile:int;		//施法动作id
		public var atkEffectId:int;		//施法特效id
		public var actionTime:int;		//施法动作播放时间(毫秒 1秒=1000毫秒)
		public var atkEffectBegin:int;		//施法特效起始播放秒数（相对于施法动作 毫秒）
		public var atkEffectTime:int;		//施法特效播放总秒数（毫秒）
		public var atkEffectAdd:Array;		//施法特效需求效果1叠加2XX

		public function Skill(data:ByteArray)
		{
			super(data);
			id = data.readInt();
			advanceId = data.readInt();
			maxLevel = data.readInt();
			name = data.readUTF();
			describe = data.readUTF();
			icon = data.readInt();
			type = data.readUnsignedByte();
			trigger = data.readUnsignedByte();
			valueId = data.readInt();
			value = data.readInt();
			probability = data.readInt();
			costType = data.readUnsignedByte();
			costValue = data.readInt();
			logicId = data.readUTF().split("_");
			logicMaybeId = data.readUTF().split("_");
			logicProbability = data.readInt();
			growControl = data.readUTF().split("_");
			growCoefficient = data.readInt();
			musicAtkId = data.readInt();
			musicBallisticId = data.readInt();
			musicStruckId = data.readInt();
			skillWeight = data.readInt();
			lens = data.readInt();
			readyActionFile = data.readInt();
			readyEffectId = data.readInt();
			readyEffectAdd = data.readUTF().split("_");
			readyTime = data.readInt();
			actionFile = data.readInt();
			atkEffectId = data.readInt();
			actionTime = data.readInt();
			atkEffectBegin = data.readInt();
			atkEffectTime = data.readInt();
			atkEffectAdd = data.readUTF().split("_");		
		}
	}
}
