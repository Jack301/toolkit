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

	public class SceneOverall extends StaticInfoBase
	{
		public var name:String;		//地图名称
		public var avatar:int;		//场景形象ID
		public var liiimitHei:Array = [];		//条件
		public var limitWu:Array;		//场景进入条件1等级限制_等级2任务限制_任务id
		public var x:int;		//场景通道类型
		public var y:int;		//场景通道类型
		public var z:int;		//场景通道类型
		public var helloChannels:Vector.<ChannelType>;	
		public var fromChannels:Vector.<ChannelType>;	
		public var exampleChannel:Vector.<ChannelType>;	

		public function SceneOverall(data:ByteArray)
		{
			super(data);
			name = data.readUTF();
			avatar = data.readUnsignedInt();

			var array:Array = data.readUTF.split(";");
			for (var i:int = 0; i < array.length; i++)
			{
				liiimitHei.push(array[i].split("_"));
			}

			limitWu = data.readUTF().split("_");
			fromChannels = new Vector.<ChannelType>();
			var l:int = data.readUnsignedByte();
			for(i = 0; i < l; i++)
			{
				var eachChannelType : ChannelType = new ChannelType();
				eachChannelType.mapId = data.readUnsignedShort();
				eachChannelType.x = data.readUnsignedInt();
				eachChannelType.y = data.readUnsignedInt();

				fromChannels.push(eachChannelType);
			}

			helloChannels = new Vector.<ChannelType>();
			var l:int = data.readUnsignedByte();
			for(i = 0; i < l; i++)
			{
				var eachChannelType : ChannelType = new ChannelType();
				eachChannelType.mapId = data.readUnsignedShort();
				eachChannelType.x = data.readUnsignedInt();
				eachChannelType.y = data.readUnsignedInt();

				helloChannels.push(eachChannelType);
			}

			exampleChannel = new Vector.<ChannelType>();
			var l:int = data.readUnsignedByte();
			for(i = 0; i < l; i++)
			{
				var eachChannelType : ChannelType = new ChannelType();
				eachChannelType.mapId = data.readUnsignedShort();
				eachChannelType.x = data.readUnsignedInt();
				eachChannelType.y = data.readUnsignedInt();

				exampleChannel.push(eachChannelType);
			}

			x = data.readUnsignedByte();
			y = data.readUnsignedInt();
			z = data.readUnsignedInt();		
		}
	}
}
