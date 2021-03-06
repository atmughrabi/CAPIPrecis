-- sfpp_reconfig.vhd

-- Generated using ACDS version 15.1 185

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sfpp_reconfig is
	port (
		alt_xcvr_reconfig_0_ch0_1_from_xcvr_reconfig_from_xcvr : in  std_logic_vector(91 downto 0)  := (others => '0'); -- alt_xcvr_reconfig_0_ch0_1_from_xcvr.reconfig_from_xcvr
		alt_xcvr_reconfig_0_ch0_1_to_xcvr_reconfig_to_xcvr     : out std_logic_vector(139 downto 0);                    --   alt_xcvr_reconfig_0_ch0_1_to_xcvr.reconfig_to_xcvr
		alt_xcvr_reconfig_0_ch2_3_from_xcvr_reconfig_from_xcvr : in  std_logic_vector(91 downto 0)  := (others => '0'); -- alt_xcvr_reconfig_0_ch2_3_from_xcvr.reconfig_from_xcvr
		alt_xcvr_reconfig_0_ch2_3_to_xcvr_reconfig_to_xcvr     : out std_logic_vector(139 downto 0);                    --   alt_xcvr_reconfig_0_ch2_3_to_xcvr.reconfig_to_xcvr
		alt_xcvr_reconfig_0_reconfig_busy_reconfig_busy        : out std_logic;                                         --   alt_xcvr_reconfig_0_reconfig_busy.reconfig_busy
		clk_clk                                                : in  std_logic                      := '0';             --                                 clk.clk
		reset_reset_n                                          : in  std_logic                      := '0'              --                               reset.reset_n
	);
end entity sfpp_reconfig;

architecture rtl of sfpp_reconfig is
	component alt_xcvr_reconfig is
		generic (
			device_family                 : string  := "Stratix V";
			number_of_reconfig_interfaces : integer := 2;
			enable_offset                 : integer := 1;
			enable_lc                     : integer := 1;
			enable_dcd                    : integer := 0;
			enable_dcd_power_up           : integer := 1;
			enable_analog                 : integer := 1;
			enable_eyemon                 : integer := 0;
			enable_ber                    : integer := 0;
			enable_dfe                    : integer := 0;
			enable_adce                   : integer := 0;
			enable_mif                    : integer := 0;
			enable_pll                    : integer := 0
		);
		port (
			reconfig_busy             : out std_logic;                                         -- reconfig_busy
			mgmt_clk_clk              : in  std_logic                      := 'X';             -- clk
			mgmt_rst_reset            : in  std_logic                      := 'X';             -- reset
			reconfig_mgmt_address     : in  std_logic_vector(6 downto 0)   := (others => 'X'); -- address
			reconfig_mgmt_read        : in  std_logic                      := 'X';             -- read
			reconfig_mgmt_readdata    : out std_logic_vector(31 downto 0);                     -- readdata
			reconfig_mgmt_waitrequest : out std_logic;                                         -- waitrequest
			reconfig_mgmt_write       : in  std_logic                      := 'X';             -- write
			reconfig_mgmt_writedata   : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			reconfig_to_xcvr          : out std_logic_vector(279 downto 0);                    -- reconfig_to_xcvr
			reconfig_from_xcvr        : in  std_logic_vector(183 downto 0) := (others => 'X'); -- reconfig_from_xcvr
			tx_cal_busy               : out std_logic;                                         -- tx_cal_busy
			rx_cal_busy               : out std_logic;                                         -- tx_cal_busy
			cal_busy_in               : in  std_logic                      := 'X';             -- cal_busy_in
			reconfig_mif_address      : out std_logic_vector(31 downto 0);                     -- address
			reconfig_mif_read         : out std_logic;                                         -- read
			reconfig_mif_readdata     : in  std_logic_vector(15 downto 0)  := (others => 'X'); -- readdata
			reconfig_mif_waitrequest  : in  std_logic                      := 'X'              -- waitrequest
		);
	end component alt_xcvr_reconfig;

	component sfpp_reconfig_master_0 is
		port (
			clk_clk              : in  std_logic                     := 'X';             -- clk
			clk_reset_reset      : in  std_logic                     := 'X';             -- reset
			master_address       : out std_logic_vector(31 downto 0);                    -- address
			master_readdata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			master_read          : out std_logic;                                        -- read
			master_write         : out std_logic;                                        -- write
			master_writedata     : out std_logic_vector(31 downto 0);                    -- writedata
			master_waitrequest   : in  std_logic                     := 'X';             -- waitrequest
			master_readdatavalid : in  std_logic                     := 'X';             -- readdatavalid
			master_byteenable    : out std_logic_vector(3 downto 0);                     -- byteenable
			master_reset_reset   : out std_logic                                         -- reset
		);
	end component sfpp_reconfig_master_0;

	component sfpp_reconfig_mm_interconnect_0 is
		port (
			clk_0_clk_clk                                                  : in  std_logic                     := 'X';             -- clk
			alt_xcvr_reconfig_0_mgmt_rst_reset_reset_bridge_in_reset_reset : in  std_logic                     := 'X';             -- reset
			master_0_clk_reset_reset_bridge_in_reset_reset                 : in  std_logic                     := 'X';             -- reset
			master_0_master_translator_reset_reset_bridge_in_reset_reset   : in  std_logic                     := 'X';             -- reset
			master_0_master_address                                        : in  std_logic_vector(31 downto 0) := (others => 'X'); -- address
			master_0_master_waitrequest                                    : out std_logic;                                        -- waitrequest
			master_0_master_byteenable                                     : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			master_0_master_read                                           : in  std_logic                     := 'X';             -- read
			master_0_master_readdata                                       : out std_logic_vector(31 downto 0);                    -- readdata
			master_0_master_readdatavalid                                  : out std_logic;                                        -- readdatavalid
			master_0_master_write                                          : in  std_logic                     := 'X';             -- write
			master_0_master_writedata                                      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			alt_xcvr_reconfig_0_reconfig_mgmt_address                      : out std_logic_vector(6 downto 0);                     -- address
			alt_xcvr_reconfig_0_reconfig_mgmt_write                        : out std_logic;                                        -- write
			alt_xcvr_reconfig_0_reconfig_mgmt_read                         : out std_logic;                                        -- read
			alt_xcvr_reconfig_0_reconfig_mgmt_readdata                     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			alt_xcvr_reconfig_0_reconfig_mgmt_writedata                    : out std_logic_vector(31 downto 0);                    -- writedata
			alt_xcvr_reconfig_0_reconfig_mgmt_waitrequest                  : in  std_logic                     := 'X'              -- waitrequest
		);
	end component sfpp_reconfig_mm_interconnect_0;

	component sfpp_reconfig_rst_controller is
		generic (
			NUM_RESET_INPUTS          : integer := 6;
			OUTPUT_RESET_SYNC_EDGES   : string  := "deassert";
			SYNC_DEPTH                : integer := 2;
			RESET_REQUEST_PRESENT     : integer := 0;
			RESET_REQ_WAIT_TIME       : integer := 1;
			MIN_RST_ASSERTION_TIME    : integer := 3;
			RESET_REQ_EARLY_DSRT_TIME : integer := 1;
			USE_RESET_REQUEST_IN0     : integer := 0;
			USE_RESET_REQUEST_IN1     : integer := 0;
			USE_RESET_REQUEST_IN2     : integer := 0;
			USE_RESET_REQUEST_IN3     : integer := 0;
			USE_RESET_REQUEST_IN4     : integer := 0;
			USE_RESET_REQUEST_IN5     : integer := 0;
			USE_RESET_REQUEST_IN6     : integer := 0;
			USE_RESET_REQUEST_IN7     : integer := 0;
			USE_RESET_REQUEST_IN8     : integer := 0;
			USE_RESET_REQUEST_IN9     : integer := 0;
			USE_RESET_REQUEST_IN10    : integer := 0;
			USE_RESET_REQUEST_IN11    : integer := 0;
			USE_RESET_REQUEST_IN12    : integer := 0;
			USE_RESET_REQUEST_IN13    : integer := 0;
			USE_RESET_REQUEST_IN14    : integer := 0;
			USE_RESET_REQUEST_IN15    : integer := 0;
			ADAPT_RESET_REQUEST       : integer := 0
		);
		port (
			reset_in0      : in  std_logic := 'X'; -- reset
			reset_in1      : in  std_logic := 'X'; -- reset
			clk            : in  std_logic := 'X'; -- clk
			reset_out      : out std_logic;        -- reset
			reset_req      : out std_logic;        -- reset_req
			reset_req_in0  : in  std_logic := 'X'; -- reset_req
			reset_req_in1  : in  std_logic := 'X'; -- reset_req
			reset_in2      : in  std_logic := 'X'; -- reset
			reset_req_in2  : in  std_logic := 'X'; -- reset_req
			reset_in3      : in  std_logic := 'X'; -- reset
			reset_req_in3  : in  std_logic := 'X'; -- reset_req
			reset_in4      : in  std_logic := 'X'; -- reset
			reset_req_in4  : in  std_logic := 'X'; -- reset_req
			reset_in5      : in  std_logic := 'X'; -- reset
			reset_req_in5  : in  std_logic := 'X'; -- reset_req
			reset_in6      : in  std_logic := 'X'; -- reset
			reset_req_in6  : in  std_logic := 'X'; -- reset_req
			reset_in7      : in  std_logic := 'X'; -- reset
			reset_req_in7  : in  std_logic := 'X'; -- reset_req
			reset_in8      : in  std_logic := 'X'; -- reset
			reset_req_in8  : in  std_logic := 'X'; -- reset_req
			reset_in9      : in  std_logic := 'X'; -- reset
			reset_req_in9  : in  std_logic := 'X'; -- reset_req
			reset_in10     : in  std_logic := 'X'; -- reset
			reset_req_in10 : in  std_logic := 'X'; -- reset_req
			reset_in11     : in  std_logic := 'X'; -- reset
			reset_req_in11 : in  std_logic := 'X'; -- reset_req
			reset_in12     : in  std_logic := 'X'; -- reset
			reset_req_in12 : in  std_logic := 'X'; -- reset_req
			reset_in13     : in  std_logic := 'X'; -- reset
			reset_req_in13 : in  std_logic := 'X'; -- reset_req
			reset_in14     : in  std_logic := 'X'; -- reset
			reset_req_in14 : in  std_logic := 'X'; -- reset_req
			reset_in15     : in  std_logic := 'X'; -- reset
			reset_req_in15 : in  std_logic := 'X'  -- reset_req
		);
	end component sfpp_reconfig_rst_controller;

	component sfpp_reconfig_rst_controller_001 is
		generic (
			NUM_RESET_INPUTS          : integer := 6;
			OUTPUT_RESET_SYNC_EDGES   : string  := "deassert";
			SYNC_DEPTH                : integer := 2;
			RESET_REQUEST_PRESENT     : integer := 0;
			RESET_REQ_WAIT_TIME       : integer := 1;
			MIN_RST_ASSERTION_TIME    : integer := 3;
			RESET_REQ_EARLY_DSRT_TIME : integer := 1;
			USE_RESET_REQUEST_IN0     : integer := 0;
			USE_RESET_REQUEST_IN1     : integer := 0;
			USE_RESET_REQUEST_IN2     : integer := 0;
			USE_RESET_REQUEST_IN3     : integer := 0;
			USE_RESET_REQUEST_IN4     : integer := 0;
			USE_RESET_REQUEST_IN5     : integer := 0;
			USE_RESET_REQUEST_IN6     : integer := 0;
			USE_RESET_REQUEST_IN7     : integer := 0;
			USE_RESET_REQUEST_IN8     : integer := 0;
			USE_RESET_REQUEST_IN9     : integer := 0;
			USE_RESET_REQUEST_IN10    : integer := 0;
			USE_RESET_REQUEST_IN11    : integer := 0;
			USE_RESET_REQUEST_IN12    : integer := 0;
			USE_RESET_REQUEST_IN13    : integer := 0;
			USE_RESET_REQUEST_IN14    : integer := 0;
			USE_RESET_REQUEST_IN15    : integer := 0;
			ADAPT_RESET_REQUEST       : integer := 0
		);
		port (
			reset_in0      : in  std_logic := 'X'; -- reset
			clk            : in  std_logic := 'X'; -- clk
			reset_out      : out std_logic;        -- reset
			reset_req      : out std_logic;        -- reset_req
			reset_req_in0  : in  std_logic := 'X'; -- reset_req
			reset_in1      : in  std_logic := 'X'; -- reset
			reset_req_in1  : in  std_logic := 'X'; -- reset_req
			reset_in2      : in  std_logic := 'X'; -- reset
			reset_req_in2  : in  std_logic := 'X'; -- reset_req
			reset_in3      : in  std_logic := 'X'; -- reset
			reset_req_in3  : in  std_logic := 'X'; -- reset_req
			reset_in4      : in  std_logic := 'X'; -- reset
			reset_req_in4  : in  std_logic := 'X'; -- reset_req
			reset_in5      : in  std_logic := 'X'; -- reset
			reset_req_in5  : in  std_logic := 'X'; -- reset_req
			reset_in6      : in  std_logic := 'X'; -- reset
			reset_req_in6  : in  std_logic := 'X'; -- reset_req
			reset_in7      : in  std_logic := 'X'; -- reset
			reset_req_in7  : in  std_logic := 'X'; -- reset_req
			reset_in8      : in  std_logic := 'X'; -- reset
			reset_req_in8  : in  std_logic := 'X'; -- reset_req
			reset_in9      : in  std_logic := 'X'; -- reset
			reset_req_in9  : in  std_logic := 'X'; -- reset_req
			reset_in10     : in  std_logic := 'X'; -- reset
			reset_req_in10 : in  std_logic := 'X'; -- reset_req
			reset_in11     : in  std_logic := 'X'; -- reset
			reset_req_in11 : in  std_logic := 'X'; -- reset_req
			reset_in12     : in  std_logic := 'X'; -- reset
			reset_req_in12 : in  std_logic := 'X'; -- reset_req
			reset_in13     : in  std_logic := 'X'; -- reset
			reset_req_in13 : in  std_logic := 'X'; -- reset_req
			reset_in14     : in  std_logic := 'X'; -- reset
			reset_req_in14 : in  std_logic := 'X'; -- reset_req
			reset_in15     : in  std_logic := 'X'; -- reset
			reset_req_in15 : in  std_logic := 'X'  -- reset_req
		);
	end component sfpp_reconfig_rst_controller_001;

	signal master_0_master_readdata                                        : std_logic_vector(31 downto 0);  -- mm_interconnect_0:master_0_master_readdata -> master_0:master_readdata
	signal master_0_master_waitrequest                                     : std_logic;                      -- mm_interconnect_0:master_0_master_waitrequest -> master_0:master_waitrequest
	signal master_0_master_address                                         : std_logic_vector(31 downto 0);  -- master_0:master_address -> mm_interconnect_0:master_0_master_address
	signal master_0_master_read                                            : std_logic;                      -- master_0:master_read -> mm_interconnect_0:master_0_master_read
	signal master_0_master_byteenable                                      : std_logic_vector(3 downto 0);   -- master_0:master_byteenable -> mm_interconnect_0:master_0_master_byteenable
	signal master_0_master_readdatavalid                                   : std_logic;                      -- mm_interconnect_0:master_0_master_readdatavalid -> master_0:master_readdatavalid
	signal master_0_master_write                                           : std_logic;                      -- master_0:master_write -> mm_interconnect_0:master_0_master_write
	signal master_0_master_writedata                                       : std_logic_vector(31 downto 0);  -- master_0:master_writedata -> mm_interconnect_0:master_0_master_writedata
	signal mm_interconnect_0_alt_xcvr_reconfig_0_reconfig_mgmt_readdata    : std_logic_vector(31 downto 0);  -- alt_xcvr_reconfig_0:reconfig_mgmt_readdata -> mm_interconnect_0:alt_xcvr_reconfig_0_reconfig_mgmt_readdata
	signal mm_interconnect_0_alt_xcvr_reconfig_0_reconfig_mgmt_waitrequest : std_logic;                      -- alt_xcvr_reconfig_0:reconfig_mgmt_waitrequest -> mm_interconnect_0:alt_xcvr_reconfig_0_reconfig_mgmt_waitrequest
	signal mm_interconnect_0_alt_xcvr_reconfig_0_reconfig_mgmt_address     : std_logic_vector(6 downto 0);   -- mm_interconnect_0:alt_xcvr_reconfig_0_reconfig_mgmt_address -> alt_xcvr_reconfig_0:reconfig_mgmt_address
	signal mm_interconnect_0_alt_xcvr_reconfig_0_reconfig_mgmt_read        : std_logic;                      -- mm_interconnect_0:alt_xcvr_reconfig_0_reconfig_mgmt_read -> alt_xcvr_reconfig_0:reconfig_mgmt_read
	signal mm_interconnect_0_alt_xcvr_reconfig_0_reconfig_mgmt_write       : std_logic;                      -- mm_interconnect_0:alt_xcvr_reconfig_0_reconfig_mgmt_write -> alt_xcvr_reconfig_0:reconfig_mgmt_write
	signal mm_interconnect_0_alt_xcvr_reconfig_0_reconfig_mgmt_writedata   : std_logic_vector(31 downto 0);  -- mm_interconnect_0:alt_xcvr_reconfig_0_reconfig_mgmt_writedata -> alt_xcvr_reconfig_0:reconfig_mgmt_writedata
	signal rst_controller_reset_out_reset                                  : std_logic;                      -- rst_controller:reset_out -> [alt_xcvr_reconfig_0:mgmt_rst_reset, mm_interconnect_0:alt_xcvr_reconfig_0_mgmt_rst_reset_reset_bridge_in_reset_reset]
	signal master_0_master_reset_reset                                     : std_logic;                      -- master_0:master_reset_reset -> rst_controller:reset_in1
	signal rst_controller_001_reset_out_reset                              : std_logic;                      -- rst_controller_001:reset_out -> [mm_interconnect_0:master_0_clk_reset_reset_bridge_in_reset_reset, mm_interconnect_0:master_0_master_translator_reset_reset_bridge_in_reset_reset]
	signal reset_reset_n_ports_inv                                         : std_logic;                      -- reset_reset_n:inv -> [master_0:clk_reset_reset, rst_controller:reset_in0, rst_controller_001:reset_in0]
	signal alt_xcvr_reconfig_0_reconfig_to_xcvr                            : std_logic_vector(279 downto 0); -- port fragment

begin

	alt_xcvr_reconfig_0 : component alt_xcvr_reconfig
		generic map (
			device_family                 => "Stratix V",
			number_of_reconfig_interfaces => 4,
			enable_offset                 => 1,
			enable_lc                     => 1,
			enable_dcd                    => 0,
			enable_dcd_power_up           => 1,
			enable_analog                 => 1,
			enable_eyemon                 => 1,
			enable_ber                    => 1,
			enable_dfe                    => 0,
			enable_adce                   => 0,
			enable_mif                    => 0,
			enable_pll                    => 0
		)
		port map (
			reconfig_busy                     => alt_xcvr_reconfig_0_reconfig_busy_reconfig_busy,                     --   reconfig_busy.reconfig_busy
			mgmt_clk_clk                      => clk_clk,                                                             --    mgmt_clk_clk.clk
			mgmt_rst_reset                    => rst_controller_reset_out_reset,                                      --  mgmt_rst_reset.reset
			reconfig_mgmt_address             => mm_interconnect_0_alt_xcvr_reconfig_0_reconfig_mgmt_address,         --   reconfig_mgmt.address
			reconfig_mgmt_read                => mm_interconnect_0_alt_xcvr_reconfig_0_reconfig_mgmt_read,            --                .read
			reconfig_mgmt_readdata            => mm_interconnect_0_alt_xcvr_reconfig_0_reconfig_mgmt_readdata,        --                .readdata
			reconfig_mgmt_waitrequest         => mm_interconnect_0_alt_xcvr_reconfig_0_reconfig_mgmt_waitrequest,     --                .waitrequest
			reconfig_mgmt_write               => mm_interconnect_0_alt_xcvr_reconfig_0_reconfig_mgmt_write,           --                .write
			reconfig_mgmt_writedata           => mm_interconnect_0_alt_xcvr_reconfig_0_reconfig_mgmt_writedata,       --                .writedata
			reconfig_to_xcvr                  => alt_xcvr_reconfig_0_reconfig_to_xcvr,                                --   ch0_1_to_xcvr.reconfig_to_xcvr
			reconfig_from_xcvr(91 downto 0)   => alt_xcvr_reconfig_0_ch0_1_from_xcvr_reconfig_from_xcvr(91 downto 0), -- ch0_1_from_xcvr.reconfig_from_xcvr
			reconfig_from_xcvr(183 downto 92) => alt_xcvr_reconfig_0_ch2_3_from_xcvr_reconfig_from_xcvr(91 downto 0), -- ch0_1_from_xcvr.reconfig_from_xcvr
			tx_cal_busy                       => open,                                                                --     (terminated)
			rx_cal_busy                       => open,                                                                --     (terminated)
			cal_busy_in                       => '0',                                                                 --     (terminated)
			reconfig_mif_address              => open,                                                                --     (terminated)
			reconfig_mif_read                 => open,                                                                --     (terminated)
			reconfig_mif_readdata             => "0000000000000000",                                                  --     (terminated)
			reconfig_mif_waitrequest          => '0'                                                                  --     (terminated)
		);

	master_0 : component sfpp_reconfig_master_0
		port map (
			clk_clk              => clk_clk,                       --          clk.clk
			clk_reset_reset      => reset_reset_n_ports_inv,       --    clk_reset.reset
			master_address       => master_0_master_address,       --       master.address
			master_readdata      => master_0_master_readdata,      --             .readdata
			master_read          => master_0_master_read,          --             .read
			master_write         => master_0_master_write,         --             .write
			master_writedata     => master_0_master_writedata,     --             .writedata
			master_waitrequest   => master_0_master_waitrequest,   --             .waitrequest
			master_readdatavalid => master_0_master_readdatavalid, --             .readdatavalid
			master_byteenable    => master_0_master_byteenable,    --             .byteenable
			master_reset_reset   => master_0_master_reset_reset    -- master_reset.reset
		);

	mm_interconnect_0 : component sfpp_reconfig_mm_interconnect_0
		port map (
			clk_0_clk_clk                                                  => clk_clk,                                                         --                                                clk_0_clk.clk
			alt_xcvr_reconfig_0_mgmt_rst_reset_reset_bridge_in_reset_reset => rst_controller_reset_out_reset,                                  -- alt_xcvr_reconfig_0_mgmt_rst_reset_reset_bridge_in_reset.reset
			master_0_clk_reset_reset_bridge_in_reset_reset                 => rst_controller_001_reset_out_reset,                              --                 master_0_clk_reset_reset_bridge_in_reset.reset
			master_0_master_translator_reset_reset_bridge_in_reset_reset   => rst_controller_001_reset_out_reset,                              --   master_0_master_translator_reset_reset_bridge_in_reset.reset
			master_0_master_address                                        => master_0_master_address,                                         --                                          master_0_master.address
			master_0_master_waitrequest                                    => master_0_master_waitrequest,                                     --                                                         .waitrequest
			master_0_master_byteenable                                     => master_0_master_byteenable,                                      --                                                         .byteenable
			master_0_master_read                                           => master_0_master_read,                                            --                                                         .read
			master_0_master_readdata                                       => master_0_master_readdata,                                        --                                                         .readdata
			master_0_master_readdatavalid                                  => master_0_master_readdatavalid,                                   --                                                         .readdatavalid
			master_0_master_write                                          => master_0_master_write,                                           --                                                         .write
			master_0_master_writedata                                      => master_0_master_writedata,                                       --                                                         .writedata
			alt_xcvr_reconfig_0_reconfig_mgmt_address                      => mm_interconnect_0_alt_xcvr_reconfig_0_reconfig_mgmt_address,     --                        alt_xcvr_reconfig_0_reconfig_mgmt.address
			alt_xcvr_reconfig_0_reconfig_mgmt_write                        => mm_interconnect_0_alt_xcvr_reconfig_0_reconfig_mgmt_write,       --                                                         .write
			alt_xcvr_reconfig_0_reconfig_mgmt_read                         => mm_interconnect_0_alt_xcvr_reconfig_0_reconfig_mgmt_read,        --                                                         .read
			alt_xcvr_reconfig_0_reconfig_mgmt_readdata                     => mm_interconnect_0_alt_xcvr_reconfig_0_reconfig_mgmt_readdata,    --                                                         .readdata
			alt_xcvr_reconfig_0_reconfig_mgmt_writedata                    => mm_interconnect_0_alt_xcvr_reconfig_0_reconfig_mgmt_writedata,   --                                                         .writedata
			alt_xcvr_reconfig_0_reconfig_mgmt_waitrequest                  => mm_interconnect_0_alt_xcvr_reconfig_0_reconfig_mgmt_waitrequest  --                                                         .waitrequest
		);

	rst_controller : component sfpp_reconfig_rst_controller
		generic map (
			NUM_RESET_INPUTS          => 2,
			OUTPUT_RESET_SYNC_EDGES   => "deassert",
			SYNC_DEPTH                => 2,
			RESET_REQUEST_PRESENT     => 0,
			RESET_REQ_WAIT_TIME       => 1,
			MIN_RST_ASSERTION_TIME    => 3,
			RESET_REQ_EARLY_DSRT_TIME => 1,
			USE_RESET_REQUEST_IN0     => 0,
			USE_RESET_REQUEST_IN1     => 0,
			USE_RESET_REQUEST_IN2     => 0,
			USE_RESET_REQUEST_IN3     => 0,
			USE_RESET_REQUEST_IN4     => 0,
			USE_RESET_REQUEST_IN5     => 0,
			USE_RESET_REQUEST_IN6     => 0,
			USE_RESET_REQUEST_IN7     => 0,
			USE_RESET_REQUEST_IN8     => 0,
			USE_RESET_REQUEST_IN9     => 0,
			USE_RESET_REQUEST_IN10    => 0,
			USE_RESET_REQUEST_IN11    => 0,
			USE_RESET_REQUEST_IN12    => 0,
			USE_RESET_REQUEST_IN13    => 0,
			USE_RESET_REQUEST_IN14    => 0,
			USE_RESET_REQUEST_IN15    => 0,
			ADAPT_RESET_REQUEST       => 0
		)
		port map (
			reset_in0      => reset_reset_n_ports_inv,        -- reset_in0.reset
			reset_in1      => master_0_master_reset_reset,    -- reset_in1.reset
			clk            => clk_clk,                        --       clk.clk
			reset_out      => rst_controller_reset_out_reset, -- reset_out.reset
			reset_req      => open,                           -- (terminated)
			reset_req_in0  => '0',                            -- (terminated)
			reset_req_in1  => '0',                            -- (terminated)
			reset_in2      => '0',                            -- (terminated)
			reset_req_in2  => '0',                            -- (terminated)
			reset_in3      => '0',                            -- (terminated)
			reset_req_in3  => '0',                            -- (terminated)
			reset_in4      => '0',                            -- (terminated)
			reset_req_in4  => '0',                            -- (terminated)
			reset_in5      => '0',                            -- (terminated)
			reset_req_in5  => '0',                            -- (terminated)
			reset_in6      => '0',                            -- (terminated)
			reset_req_in6  => '0',                            -- (terminated)
			reset_in7      => '0',                            -- (terminated)
			reset_req_in7  => '0',                            -- (terminated)
			reset_in8      => '0',                            -- (terminated)
			reset_req_in8  => '0',                            -- (terminated)
			reset_in9      => '0',                            -- (terminated)
			reset_req_in9  => '0',                            -- (terminated)
			reset_in10     => '0',                            -- (terminated)
			reset_req_in10 => '0',                            -- (terminated)
			reset_in11     => '0',                            -- (terminated)
			reset_req_in11 => '0',                            -- (terminated)
			reset_in12     => '0',                            -- (terminated)
			reset_req_in12 => '0',                            -- (terminated)
			reset_in13     => '0',                            -- (terminated)
			reset_req_in13 => '0',                            -- (terminated)
			reset_in14     => '0',                            -- (terminated)
			reset_req_in14 => '0',                            -- (terminated)
			reset_in15     => '0',                            -- (terminated)
			reset_req_in15 => '0'                             -- (terminated)
		);

	rst_controller_001 : component sfpp_reconfig_rst_controller_001
		generic map (
			NUM_RESET_INPUTS          => 1,
			OUTPUT_RESET_SYNC_EDGES   => "deassert",
			SYNC_DEPTH                => 2,
			RESET_REQUEST_PRESENT     => 0,
			RESET_REQ_WAIT_TIME       => 1,
			MIN_RST_ASSERTION_TIME    => 3,
			RESET_REQ_EARLY_DSRT_TIME => 1,
			USE_RESET_REQUEST_IN0     => 0,
			USE_RESET_REQUEST_IN1     => 0,
			USE_RESET_REQUEST_IN2     => 0,
			USE_RESET_REQUEST_IN3     => 0,
			USE_RESET_REQUEST_IN4     => 0,
			USE_RESET_REQUEST_IN5     => 0,
			USE_RESET_REQUEST_IN6     => 0,
			USE_RESET_REQUEST_IN7     => 0,
			USE_RESET_REQUEST_IN8     => 0,
			USE_RESET_REQUEST_IN9     => 0,
			USE_RESET_REQUEST_IN10    => 0,
			USE_RESET_REQUEST_IN11    => 0,
			USE_RESET_REQUEST_IN12    => 0,
			USE_RESET_REQUEST_IN13    => 0,
			USE_RESET_REQUEST_IN14    => 0,
			USE_RESET_REQUEST_IN15    => 0,
			ADAPT_RESET_REQUEST       => 0
		)
		port map (
			reset_in0      => reset_reset_n_ports_inv,            -- reset_in0.reset
			clk            => clk_clk,                            --       clk.clk
			reset_out      => rst_controller_001_reset_out_reset, -- reset_out.reset
			reset_req      => open,                               -- (terminated)
			reset_req_in0  => '0',                                -- (terminated)
			reset_in1      => '0',                                -- (terminated)
			reset_req_in1  => '0',                                -- (terminated)
			reset_in2      => '0',                                -- (terminated)
			reset_req_in2  => '0',                                -- (terminated)
			reset_in3      => '0',                                -- (terminated)
			reset_req_in3  => '0',                                -- (terminated)
			reset_in4      => '0',                                -- (terminated)
			reset_req_in4  => '0',                                -- (terminated)
			reset_in5      => '0',                                -- (terminated)
			reset_req_in5  => '0',                                -- (terminated)
			reset_in6      => '0',                                -- (terminated)
			reset_req_in6  => '0',                                -- (terminated)
			reset_in7      => '0',                                -- (terminated)
			reset_req_in7  => '0',                                -- (terminated)
			reset_in8      => '0',                                -- (terminated)
			reset_req_in8  => '0',                                -- (terminated)
			reset_in9      => '0',                                -- (terminated)
			reset_req_in9  => '0',                                -- (terminated)
			reset_in10     => '0',                                -- (terminated)
			reset_req_in10 => '0',                                -- (terminated)
			reset_in11     => '0',                                -- (terminated)
			reset_req_in11 => '0',                                -- (terminated)
			reset_in12     => '0',                                -- (terminated)
			reset_req_in12 => '0',                                -- (terminated)
			reset_in13     => '0',                                -- (terminated)
			reset_req_in13 => '0',                                -- (terminated)
			reset_in14     => '0',                                -- (terminated)
			reset_req_in14 => '0',                                -- (terminated)
			reset_in15     => '0',                                -- (terminated)
			reset_req_in15 => '0'                                 -- (terminated)
		);

	reset_reset_n_ports_inv <= not reset_reset_n;

	alt_xcvr_reconfig_0_ch0_1_to_xcvr_reconfig_to_xcvr <= alt_xcvr_reconfig_0_reconfig_to_xcvr(139 downto 0);

	alt_xcvr_reconfig_0_ch2_3_to_xcvr_reconfig_to_xcvr <= alt_xcvr_reconfig_0_reconfig_to_xcvr(279 downto 140);

end architecture rtl; -- of sfpp_reconfig
